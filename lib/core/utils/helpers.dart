import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpers {
  static Future<void> launchUrlString(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  static void scrollToSection(String sectionKey, Map<String, GlobalKey> keys) {
    final key = keys[sectionKey];
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }
}