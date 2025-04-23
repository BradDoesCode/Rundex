import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchWeb(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

Future<List<dynamic>> loadJsonList(String filepath) async {
  final String jsonString =
      await rootBundle.loadString(filepath);
  return json.decode(jsonString);
}
