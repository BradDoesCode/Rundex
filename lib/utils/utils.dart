import 'dart:convert';

import 'package:dragonwilds_companion/classes/provider/completed_items.dart';
import 'package:dragonwilds_companion/classes/quest/quest.dart';
import 'package:dragonwilds_companion/utils/hive.dart';
import 'package:flutter/services.dart';
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

Future<void> addToCompletedItems(String id, CompletedItemType type) async {
  final data = await HiveStorage().getBoxContentsAsMap(HiveStorage.completedBox);
  final List<String> completedItems = data[type.hiveKey] ?? [];
  if (!completedItems.contains(id)) {
    completedItems.add(id);
    await HiveStorage().put(
      HiveStorage.completedBox,
      type.hiveKey,
      completedItems,
    );
  }
}

Future<void> removeFromCompletedItems(String id, CompletedItemType type) async {
  final data = await HiveStorage().getBoxContentsAsMap(HiveStorage.completedBox);
  final List<String> completedItems = data[type.hiveKey] ?? [];
  if (completedItems.contains(id)) {
    completedItems.remove(id);
    await HiveStorage().put(
      HiveStorage.completedBox,
      type.hiveKey,
      completedItems,
    );
  }
}

