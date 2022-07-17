// not working

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:math';
import '../constants/element.dart' show ElementSpecs;
import '../constants/regex.dart' show Regex;
import '../constants/request.dart' show Formats;
import '../utils/request.dart' show Get;

Future<List> search(String query,
    {int n_hits = 30, String lang = "en", String country = "us"}) async {
  query = Uri.encodeQueryComponent(query);
  String url =
      Formats.Searchresults.build(query: query, lang: lang, country: country);

  // ignore: prefer_typing_uninitialized_variables
  var dom;
  try {
    dom = await Get(url);
  } catch (e) {
    url = Formats.Searchresults.fallback_build(query: query, lang: lang);
    dom = await Get(url);
  }

  var matches = Regex.SCRIPT.allMatches(dom);

  var dataset = {};

  for (var match in matches) {
    var matchText = match.group(0);
    var keyMatch = Regex.KEY.allMatches(matchText!);
    var valueMatch = Regex.VALUE.allMatches(matchText);

    try {
      if (keyMatch.isNotEmpty && valueMatch.isNotEmpty) {
        var key = keyMatch.first.group(1);
        var value = json.decode(valueMatch.first.group(1)!);
        dataset[key] = value;
      }
    } catch (_) {}
  }

  var len = dataset["ds:4"][0][1].length ?? 0;

  // print('dataset["ds:4"][0][1] length: $len');

  bool success = false;
  for (var idx = 0; idx < len; idx++) {
    try {
      dataset = dataset["ds:4"][0][1][idx][22][0];
      // print('dataset: ${dataset.length}');
      success = true;
    } catch (_) {}
  }
  if (!success) {
    return [];
  }

  var nApps = min(dataset.length, n_hits);
  var searchResults = [];

  for (var appIdx = 0; appIdx < nApps; appIdx++) {
    var app = {};
    for (var key in ElementSpecs.Searchresult.keys) {
      var spec = ElementSpecs.Searchresult[key];
      var content = spec!.extract_content(dataset[appIdx]);
      app[key] = content;
    }
    searchResults.add(app);
  }
  return searchResults;
}

// void main(List<String> args) async {
//   var results = await search('youtube', n_hits: 10);
//   print(results);
// }
