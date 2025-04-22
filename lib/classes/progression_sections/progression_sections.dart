import 'package:flutter/material.dart';

enum ProgressionSections { mainQuest, sideQuest, lore }

extension ProgressionSectionsExtension on ProgressionSections {
  String get title {
    switch (this) {
      case ProgressionSections.mainQuest:
        return 'Main Quests';
      case ProgressionSections.sideQuest:
        return 'Side Quest';
      case ProgressionSections.lore:
        return 'Lore';
    }
  }

  Widget get image {
    switch (this) {
      case ProgressionSections.mainQuest:
        return Icon(
          Icons.crisis_alert,
          size: 100,
        );
      case ProgressionSections.sideQuest:
        return Icon(
          Icons.crisis_alert,
          size: 100,
        );
      case ProgressionSections.lore:
        return Icon(
          Icons.crisis_alert,
          size: 100,
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
}
