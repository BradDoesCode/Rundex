import 'package:dragonwilds_companion/classes/provider/completed_items.dart';
import 'package:dragonwilds_companion/classes/quest/quest.dart';
import 'package:dragonwilds_companion/main.dart';
import 'package:dragonwilds_companion/screens/lore_scraps_screen.dart';
import 'package:dragonwilds_companion/screens/quest_list_screen.dart';
import 'package:dragonwilds_companion/utils/utils.dart';
import 'package:flutter/material.dart';

enum ProgressionSections { mainQuest, sideQuest, lore }

extension ProgressionSectionsExtension on ProgressionSections {
  String get title {
    switch (this) {
      case ProgressionSections.mainQuest:
        return 'Main Quests';
      case ProgressionSections.sideQuest:
        return 'Side Quests';
      case ProgressionSections.lore:
        return 'Lore';
    }
  }

  Widget get image {
    switch (this) {
      case ProgressionSections.mainQuest:
        return Image(
          image: AssetImage('assets/wizard.png'),
          fit: BoxFit.cover,
          height: double.infinity,
        );
      case ProgressionSections.sideQuest:
        return Image(
          image: AssetImage('assets/stone.png'),
          fit: BoxFit.cover,
          height: double.infinity,
        );
      case ProgressionSections.lore:
        return Image(
          image: AssetImage('assets/lore.png'),
          fit: BoxFit.cover,
          height: double.infinity,
        );
    }
  }

  String get subtitle {
    switch (this) {
      case ProgressionSections.mainQuest:
        return '0% Complete';
      case ProgressionSections.sideQuest:
        return '0% Complete';
      case ProgressionSections.lore:
        return '0% Complete';
    }
  }

  Widget get screen {
    switch (this) {
      case ProgressionSections.mainQuest:
        return QuestListScreen(
          type: QuestType.main,
          title: ProgressionSections.mainQuest.title,
        );
      case ProgressionSections.sideQuest:
        return QuestListScreen(
          type: QuestType.side,
          title: ProgressionSections.sideQuest.title,
        );
      case ProgressionSections.lore:
        return LoreScrapsScreen();
    }
  }

  int percent(Map<String, List<String>> completedItems) {
    switch (this) {
      case ProgressionSections.mainQuest:
        return calculateQuestPercent(
            completedItems[CompletedItemType.mainQuest.hiveKey]?.length ?? 0,
            kMainQuests);
      case ProgressionSections.sideQuest:
        return calculateQuestPercent(
            completedItems[CompletedItemType.sideQuest.hiveKey]?.length ?? 0,
            kSideQuests);
      case ProgressionSections.lore:
        return 0;
    }
  }
}

int calculateQuestPercent(int completedItems, List<Quest> quests) {
  final totalQuests = quests.fold(
      0, (int sum, Quest quest) => sum + (quest.steps?.length ?? 0));
  return completionPercentage(completedItems, totalQuests);
}
