import 'package:google_play_scraper/google_play_scraper.dart';

void main(List<String> args) async {
  String appId = "com.google.android.youtube";
  GooglePlayScraper googlePlayScraper = GooglePlayScraper();

  var permissions = await googlePlayScraper.permissions(appId: appId);

  print(permissions);

// result
// {
//    Identity: [find accounts on the device, add or remove accounts],
//    Phone: [read phone status and identity],
//    Microphone: [record audio],
//    Location: [approximate location (network-based), precise location (GPS and network-based)],
//    Storage: [modify or delete the contents of your USB storage, read the contents of your USB storage],
//    Device ID & call information: [read phone status and identity],
//    Photos/Media/Files: [modify or delete the contents of your USB storage, read the contents of your USB storage], Contacts: [read your contacts, find accounts on the device],
//    Camera: [take pictures and videos],
//    Wi-Fi connection information: [view Wi-Fi connections],
//    Other: [control Near Field Communication, view network connections, full network access, draw over other apps, run at startup, control vibration, measure app storage space, prevent device from sleeping, use accounts on the device, read Google service configuration],
//    Uncategorized: [manage document storage, receive data from Internet]
//}
}
