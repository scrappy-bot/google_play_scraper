
// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables



import 'dart:convert';
import '../constants/element.dart' show ElementSpecs, ElementSpec;
import '../constants/regex.dart' show Regex;
import '../constants/request.dart' show Formats;
import '../utils/request.dart' show Get;
import '../exceptions.dart' show NotFoundError;



Future<Map> app({required String app_id, String lang = "en", String country = "us"}) async {
  var url = Formats.Detail.build(app_id: app_id, lang: lang, country: country);
  var dom;
  try {
    dom = await Get(url);
  } catch (e) {
    if (e is NotFoundError) {
      url = Formats.Detail.fallback_build(app_id: app_id, lang: lang);
      dom = await Get(url);
    }
  }
  return parse_dom(dom: dom, app_id: app_id, url: url);
}

parse_dom({required String dom, required String app_id, required String url}) {
  var matches = Regex.SCRIPT.allMatches(dom);
  var dataset = {};

  for (var match in matches) {
    var matchText = match.group(0);
    var key_match;
    var value_match;
    if (matchText != null) {
      key_match = Regex.KEY.allMatches(matchText);
      value_match = Regex.VALUE.allMatches(matchText);
    }
    if (key_match != null && value_match != null) {
      try {
        var key = key_match.first.group(1);

        var value = json.decode(value_match.first.group(1));
        dataset[key] = value;
      // ignore: empty_catches
      } catch (e) {}
    }
  }

  var result = {};
  for (var k in ElementSpecs.Detail.keys) {
    var spec = ElementSpecs.Detail[k];

    var content;
    if (spec is List) {
      for (ElementSpec sub_spec in spec) {
        content = sub_spec.extract_content(dataset);

        if (content != null) {
          result[k] = content;
          break;
        }
      }
    } else {
      content = spec.extract_content(dataset);
      result[k] = content;
    }
  }

  result["appId"] = app_id;
  result["url"] = url;

  return result;
}

// test

// void main(List<String> args) async {
//   var app_id = "com.microsoft.office.outlook";
//   var lang = "en";
//   var country = "us";
//   var result = await app(app_id: app_id, lang: lang, country: country);
//   print(result['icon']);
// }
