import 'package:flutter_test/flutter_test.dart';

import 'package:google_play_scraper/google_play_scraper.dart';
import 'package:google_play_scraper/models.dart';

void main() {
  test('Test App: Check with AppID and Title', () async {
    String appId = "com.google.android.youtube";
    String expectedTitle = "youtube";

    String appId2 = "com.github.android";
    String expectedTitle2 = "github";

    GooglePlayScraper googlePlayScraper = GooglePlayScraper();
    App gotApp = await googlePlayScraper.app(appId: appId);
    App gotApp2 = await googlePlayScraper.app(appId: appId2);

    String? title1 = gotApp.title;
    String? title2 = gotApp2.title;

    var result = title1?.toLowerCase().contains(expectedTitle) ?? false;
    var result2 = title2?.toLowerCase().contains(expectedTitle2) ?? false;

    expect(result, true);
    expect(result2, true);
  });
}
