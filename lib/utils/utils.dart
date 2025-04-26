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

Future<bool> isQuestComplete(Quest quest, WidgetRef ref) async {
  final completedItems = ref.read(completedItemsProvider).value;
  if (completedItems == null) return false;
  for (var step in quest.steps!) {
    if (!completedItems[
            (quest.type == QuestType.main) ? CompletedItemType.mainQuest.hiveKey : CompletedItemType.sideQuest.hiveKey]!
        .contains(step.id)) {
      return false;
    }
  }
  return true;
}

Future<bool> isStepComplete(Step step, QuestType type, WidgetRef ref) async {
  final completedItems = ref.read(completedItemsProvider).value;
  if (completedItems == null) return false;
  return completedItems[(type == QuestType.main) ? CompletedItemType.mainQuest.hiveKey : CompletedItemType.sideQuest.hiveKey]!
      .contains(step.id);
}
