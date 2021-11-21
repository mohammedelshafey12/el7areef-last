import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(String link) async {
    String googleUrl = link;

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      print('could not open map');
    }
  }
}
