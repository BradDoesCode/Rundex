import 'package:dragonwilds_companion/screens/lore_scraps_screen.dart';
import 'package:dragonwilds_companion/screens/quest_list_screen.dart';
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
          type: 'main',
          title: ProgressionSections.mainQuest.title,
        );
      case ProgressionSections.sideQuest:
        return QuestListScreen(
          type: 'side',
          title: ProgressionSections.sideQuest.title,
        );
      case ProgressionSections.lore:
        return LoreScrapsScreen();
    }
  }
}
