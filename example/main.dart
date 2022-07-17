import 'package:google_play_scraper/google_play_scraper.dart';
import 'package:google_play_scraper/models.dart';

void main(List<String> args) async {
  String appId = "com.google.android.youtube";
  // String appId2 = "com.github.android";

  GooglePlayScraper googlePlayScraper = GooglePlayScraper();
  App gotApp = await googlePlayScraper.app(appId: appId);
  // App gotApp2 = await googlePlayScraper.app(appId: appId2);

  var json = gotApp.toJson();

  // ignore: avoid_print
  print(json);

// result
// {
//title: YouTube, description: Get the official YouTube app on Android phones and tablets. See what the world is watching -- from the hottest music videos to what’s popular in gaming, fashion, beauty, news, learning and more. Subscribe to channels you love, create content of your own, share with friends, and watch on any device.

// Watch and subscribe
// ● Browse personal recommendations on Home
// ● See the latest from your favorite channels in Subscriptions
// ● Look up videos you’ve watched, liked, and saved for later in Library

// Explore different topics, what’s popular, and on the rise (available in select countries)
// ● Stay up to date on what’s popular in music, gaming, beauty, news, learning and more
// ● See what’s trending on YouTube and around the world on Explore
// ● Learn about the coolest Creators, Gamers, and Artists on the Rise (available in select countries)

// Connect with the YouTube community
// ● Keep up with your favorites creators with Posts, Stories, Premieres, and Live streams
// ● Join the conversation with comments and interact with creators and other community members

// Create content from your mobile device
// ● Create or upload your own videos directly in the app
// ● Engage with your audience in real time with live streaming right from the app

// Find the experience that fits you and your family (available in select countries)
// ● Every family has their own approach to online video. Learn about your options: the YouTube Kids app or a new parent supervised experience on YouTube at youtube.com/myfamily

// Support creators you love with channel memberships (available in select countries)
// ● Join channels that offer paid monthly memberships and support their work
// ● Get access to exclusive perks from the channel & become part of their members community
// ● Stand out in comments and live chats with a loyalty badge next to your username

// Upgrade to YouTube Premium (available in select countries)
// ● Watch videos uninterrupted by ads, while using other apps, or when the screen is locked
// ● Save videos for when you really need them – like when you’re on a plane or commuting
// ● Get access to YouTube Music Premium as part of your benefits,
// descriptionHTML: Get the official YouTube app on Android phones and tablets. See what the world is watching -- from the hottest music videos to what’s popular in gaming, fashion, beauty, news, learning and more. Subscribe to channels you love, create content of your own, share with friends, and watch on any device.<br><br>Watch and subscribe <br>● Browse personal recommendations on Home<br>● See the latest from your favorite channels in Subscriptions <br>● Look up videos you’ve watched, liked, and saved for later in Library <br><br>Explore different topics, what’s popular, and on the rise (available in select countries)<br>● Stay up to date on what’s popular in music, gaming, beauty, news, learning and more<br>● See what’s trending on YouTube and around the world on Explore<br>● Learn about the coolest Creators, Gamers, and Artists on the Rise (available in select countries)<br><br>Connect with the YouTube community<br>● Keep up with your favorites creators with Posts, Stories, Premieres, and Live streams<br>● Join the conversation with comments and interact with creators and other community members<br><br>Create content from your mobile device<br>● Create or upload your own videos directly in the app <br>● Engage with your audience in real time with live streaming right from the app<br><br>Find the experience that fits you and your family (available in select countries)<br>● Every family has their own approach to online video. Learn about your options: the YouTube Kids app or a new parent supervised experience on YouTube at youtube.com/myfamily<br><br>Support creators you love with channel memberships (available in select countries)<br>● Join channels that offer paid monthly memberships and support their work<br>● Get access to exclusive perks from the channel &amp; become part of their members community<br>● Stand out in comments and live chats with a loyalty badge next to your username<br><br>Upgrade to YouTube Premium (available in select countries)<br>● Watch videos uninterrupted by ads, while using other apps, or when the screen is locked<br>● Save videos for when you really need them – like when you’re on a plane or commuting<br>● Get access to YouTube Music Premium as part of your benefits, summary: Enjoy your favorite videos and channels with the official YouTube app.,
// installs: 10,000,000,000+,
//minInstalls: 10000000000,
// score: 4.221765,
//ratings: 140208845,
// reviews: 2752858,
// histogram: null,
//price: 0.0,
// isFree: false,
// currency: USD,
//isSale: false,
//saleTime: null,
// originalPrice: null,
// saleText: null,
// offersIAP: false,
// inAppProductsPrice: null,
// devoloper: null,
//devoloperId: null,
// devoloperEmail: null,
//devoloperWebsite: null,
// devoloperAddress: null,
// privacyPolicy: http://www.google.com/policies/privacy,
// genre: Video Players & Editors,
// genreId: VIDEO_PLAYERS,
// icon: https://play-lh.googleusercontent.com/lMoItBgdPPVDJsNOVtP26EKHePkwBg-PkuY9NOrc-fumRtTFP4XhpUNk_22syN4Datc,
// headerImage: https://play-lh.googleusercontent.com/vA4tG0v4aasE7oIvRIvTkOYTwom07DfqHdUPr6k7jmrDwy_qA_SonqZkw6KX0OXKAdk, screenshots: [
//https://play-lh.googleusercontent.com/BxbaFv67YkqT48wc4-9ILNSmLYLb92mgkrAYdyBwI478H2s6UDTutAveNu7cOZFEeSg, https://play-lh.googleusercontent.com/lnfQ42Hslc6B_0A37YY_sNVPGEpND0YY0hcvjKLPCDB7dJNlDPn2ILICypeJxhecBQ, https://play-lh.googleusercontent.com/nD2LH9KrtYmdruRXUn2ZQypfPHViJ1UYB1fHDN7Ti5JOmq8qHd-54oBCAVNUqvGWYC8, https://play-lh.googleusercontent.com/xCBJ9BRKffRi8orvRzLn-LcMPPc1A8QC383k8NldcIREeoprwffXPgM_m85yD61B1Ng, https://play-lh.googleusercontent.com/vOxdD2u-ys9J0U964Hle8gCzNAAht5-KR_xJcPCb1ukoGo_4ypD2nByU6wu-x8MUEw
//],
// video: https://www.youtube.com/embed/__NeP0RqACU?ps=play&vq=large&rel=0&autohide=1&showinfo=0,
// videoImage: https://play-lh.googleusercontent.com/vA4tG0v4aasE7oIvRIvTkOYTwom07DfqHdUPr6k7jmrDwy_qA_SonqZkw6KX0OXKAdk, contentRating: Teen,
// contentRatingDescription: null,
// adSupported: null,
//containsAds: false,
// released: Oct 20,
// 2010,
//updated: 1658014325,
//version: Varies with device,
//recentChanges: For new features,
// look for in-product education & notifications sharing the feature and how to use it!,
// recentChangesHTML: For new features, look for in-product education &amp; notifications sharing the feature and how to use it!, comments: [[BioResidentSKG, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucrdkbKBWT4i-mqyYJhOdLoSMMPj4zenyAmKYjZyQAQ]]], [magan moore, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucrJqGiC09eCUmKooMiZYYUN5lcRkgOCYLZEFFI5GQ]]], [DJ, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucquwHHQPDjLn_XTvAZeRli3UoXKkHIddk_NQQzraw]]], [Jose Montoya, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a/AItbvmkjTX4_MCtuBjto5EiEUOvBQyMTAhMrXsYdOlV8=mo]]], [Eleven, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucpZXa4bi_NCI8316IDeE0snwxidyMbrfS06AAod]]], [Vernon Wallace, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucoVlMvECO2o_jGiRGhhh0qh-D9WA-kL7q8vtPz61g]]], [Derek Wood, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucqBDfcHBTeL2sSv5vvgLOHofZOR56CcrQQywmhU7A]]], [Nuggetchilly, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucpGpRD60SQbGKGmi_O-qx1Oy6fi_AR8V8tpEs5g]]], [Derek Fudge, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a/AItbvmkvVbLaKwCOPJ2SdpmI25l6TKMF6Ha7-Wb7peOv=mo]]], [Dawn KindnessCountsMost, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucqBjQFPEJnVwtOk5kMU84pl7ATYg-vPYSDG1D_X]]], [Jennifer Bethke, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucr-3dX2xTNgfutobshkbhbAuruCpcWqBq9ihe_stQ]]], [Keisha Brown, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucpkSqjdGHR36t6zpgjX9g3zb21d1O3vlo6nKUm5lQ]]], [Sam Jordan, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucqgxUovxAVUG5iE6aYQgxU1nPfOkaF0P2htw0ZbvBM]]], [Evan Langnes, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucoHXmE3mZT0owjJhbMN9xUtavIg-3ug1tmxUWlA]]], [Shrungs Impostor, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucr0NVOm2S84gCDdK3eF_6t0-APytCrCzie9CGBT]]], [Mike Lee, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucp2DAuD2CUMj-8MqmUtr8KGv49CQfywm452t-0Wiwo]]], [KronkMonk, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucqMsjJpzd8djJQTjWrF_Ivv1yEIpnZmobduNTdCdw]]], [Ashley T., [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucoSnp8616jEoMszoA2Zb-9aIRteGJNvoHQacipaoQ]]], [Steven Schatzberg, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucqUrmGMjMc-IhFVjnMTzuaipWiM8B7K-SIkOKq2iw]]], [Cheng Vue, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a/AItbvmnWgWE76WORsGn4Q0zaq8aXH8JL4p0LpizEBZqn=mo]]], [Jordan McHaley, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a/AItbvmnsVWC17t0UgO_IPncUWMSzAXiwJNKWOaEy7Hf5=mo]]], [Anna Blant, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a/AItbvmmkU5makyPznp_hrlmkod98z8z4Wh9addhgU1s0=mo]]], [Diane DeHart, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucou2643daQBWCMY2xO5nEY_9aE6TDgcC-SRszl-SMg]]], [John Boland, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a/AItbvmlsCiZXEdTY-htkcfTiRRul_p-l7wiaGaqP7_8-=mo]]], [Raymond Noodles, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucrjjkK8pmUjmu4AUcT3GuLG3Hx0E_KBrwubb5DN]]], [AllenWalkerAnime7, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucomfMRTtR-4VQu_YMb6WEdTmBB0m5HKWHxh3rAkGiw]]], [Whoever this guy is idk, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucpbeyB9IXxjidDBo71hrbtAQRT9p69BxYoe8Hn0FWg]]], [HR LEGO, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucoTXeYFaF-6Oj9R1oN3YKb-AOlQczXoonRsBmU1]]], [ronny Brown, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a/AItbvmlS-wGOsSABhR9xHhaeP1AXHu8yAfL8U9IXpZiR=mo]]], [Jake Shirk, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucrhIFLsJH_keZ2_-RlChi1_f6pS6NZW3ROGlYiF]]], [Sheldon Eason, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucrbWehA7dbxdDKB4h-aZgRNNgEiu40iq1kd48XvwA]]], [Ryan Hinz, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucob2HsQh8vc1UNw1APF-m-NIv1bwR6UpeWCRdhQfw]]], [Allan Gacerez, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucq_-oSNgLlFHZyOu3fVTHPWWlfzXSrib4DUH-KBRg]]], [Kathy Lough, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a/AItbvmmSbjIpbSqQNftW1juzLediO5BNsqR_2abJkdgF=mo]]], [Peter Nielson, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a/AItbvmk3-3nIbaVbKB4vmTKJzCs0I3Kap3-bAZkbZ5ws=mo]]], [JA S, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucp9K5GxWYpPYt0_YPbCdmjt7ykHlYI6cSKV-Lj8LA]]], [Late Night Cereal, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a/AItbvmkz-uhv2FY-XVCDDcqnLg-9shm9QPgC4v2Lhg8G=mo]]], [Chief Executive Lalo, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a-/AFdZucroGliH5oj5s2XUAcOnHjTo2Ht-gfr_aHef6UAi2g]]], [captain ravioli, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a/AItbvmkhnVP-NG3PY_dlXGJsVDV_lskQzMsYRMPRqau9=mo]]], [Not Not, [null, 2, null, [null, null, https://play-lh.googleusercontent.com/a/AItbvmmOUcfigagZKbkUqxCrgx5_MSht2p6mnAtxK8EE=mo]]]], appId: com.google.android.youtube, url: https://play.google.com/store/apps/details?id=com.google.android.youtube&hl=en&gl=us}
}
