import 'package:url_launcher/url_launcher.dart';

class Browser {
  static void openLink(String link) {
    final uri = Uri.tryParse(link);
    if (uri != null) {
      launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
