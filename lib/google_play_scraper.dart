library google_play_scraper;

import 'package:google_play_scraper/features/app.dart' as fapp;
import 'package:google_play_scraper/models.dart';

class GooglePlayScraper {
  Future<App> app(
      {required String appId,
      String lang = "en",
      String country = "us"}) async {
    Map data = await fapp.app(app_id: appId, lang: lang, country: country);
    return App.fromJson(data);
  }
}
