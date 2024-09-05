import 'package:url_launcher/url_launcher.dart';

class UrlLauncherWrapper {
  Future<bool> launchUrlWrapped(Uri url) async {
    return await launchUrl(url);
  }
}
