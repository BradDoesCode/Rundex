import 'dart:convert';

import 'package:dragonwilds_companion/classes/quest/quest.dart';
import 'package:dragonwilds_companion/screens/quest_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<List<Quest>> loadMainQuests() async {
  final String jsonString =
      await rootBundle.loadString('assets/data/quests/main_quests.json');
  final List<dynamic> jsonData = json.decode(jsonString);
  return jsonData.map((quest) => Quest.fromJson(quest)).toList();
}

class MainQuestsScreen extends StatelessWidget {
  const MainQuestsScreen({super.key});

  Future<List<Quest>> _fetchQuests() async {
    return await loadMainQuests();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Quest>>(
      future: _fetchQuests(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No quests available.'));
        } else {
          final quests = snapshot.data!;

          return Scaffold(
            appBar: AppBar(
              title: Text('Main Quests'),
            ),
            body: ListView.builder(
              itemCount: quests.length,
              itemBuilder: (context, index) {
                final quest = quests[index];
                return ListTile(
                  title: Text(quest.name),
                  subtitle: Text(quest.description ?? ''),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              QuestDetailScreen(quest: quest))),
                );
              },
            ),
          );
        }
      },
    );
  }
}
