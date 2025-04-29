import 'dart:convert';

import 'package:dragonwilds_companion/classes/provider/completed_items.dart';
import 'package:dragonwilds_companion/classes/quest/quest.dart';
import 'package:dragonwilds_companion/classes/step/step.dart';
import 'package:dragonwilds_companion/utils/hive.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchWeb(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

Future<List<dynamic>> loadJsonList(String filepath) async {
  final String jsonString = await rootBundle.loadString(filepath);
  return json.decode(jsonString);
}


int completionPercentage(int completed, int total) {
  if (total == 0) {
    return 0;
  }
  return ((completed / total) * 100).round();
}
