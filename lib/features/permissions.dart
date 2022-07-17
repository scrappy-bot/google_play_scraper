

// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import '../constants/regex.dart' show Regex;
import '../constants/request.dart' show Formats;
import '../utils/request.dart' show post;
import '../constants/element.dart' show ElementSpecs;

Future<Map> permission(
    {required String app_id,
    required String lang,
    required String country}) async {
  var dom = await post(
    Formats.Permissions.build(lang: lang, country: country),
    Formats.Permissions.build_body(app_id),
    {"content-type": "application/x-www-form-urlencoded"},
  );

  var matches = json.decode(Regex.PERMISSIONS.allMatches(dom).first.group(1)!);
  List container = json.decode(matches![0][2]);
  var result = {};

  for (var permission_items in container) {
    if (permission_items is List) {
      if (permission_items.length == 2) {
        // rearrange layout to fit ElementSpecs
        permission_items = [
          ["Uncategorized", null, permission_items, null]
        ];
      }

      for (var permission in permission_items) {
        if (permission != null) {
          result[ElementSpecs.Permission_Type.extract_content(permission)] =
              ElementSpecs.Permission_List.extract_content(permission);
        }
      }
    }
  }

  return result;
}

// void main(List<String> args) async {
// //   result = permissions(
// //     'com.spotify.music',
// //     lang='en', # defaults to 'en'
// //     country='us', # defaults to 'us'
// // )

//   var result = await permission(
//     app_id: 'com.spotify.music',
//     lang: 'en',
//     country: 'us',
//   );

//   print(result);
// }
