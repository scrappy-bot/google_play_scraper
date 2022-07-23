library google_play_scraper;

import 'package:google_play_scraper/features/app.dart' as fapp;
import 'package:google_play_scraper/features/permissions.dart' as fpermissions;
import 'package:google_play_scraper/models.dart';

class GooglePlayScraper {
  Future<App> app(
      {required String appId,
      String lang = "en",
      String country = "us"}) async {
    Map data = await fapp.app(app_id: appId, lang: lang, country: country);
    return App.fromJson(data);
  }

  Future<Map<String, List<String>>> permissions(
      {required String appId,
      String lang = "en",
      String country = "us"}) async {
    Map data = await fpermissions.permission(
        app_id: appId, lang: lang, country: country);
    // remove null values
    data.removeWhere((key, value) => value == null);
    Map<String, List<String>> result = {};
    data.forEach((key, value) {
      List<String> val = [];
      for (var item in value) {
        val.add(item.toString());
      }
      result[key] = val;
    });
    return result;
  }
}
