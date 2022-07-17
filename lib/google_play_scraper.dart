library google_play_scraper;

import 'package:google_play_scraper/features/app.dart' as fapp;
import 'package:google_play_scraper/models.dart';

class GooglePlayScraper {
  static Future<App> app({required String appId, String lang = "en", String country = "us"}) async {
    Map<String,dynamic> data = await fapp.app(app_id: appId, lang: lang, country: country) as Map<String,dynamic>;
    return App.fromJson(data);
  }
}
