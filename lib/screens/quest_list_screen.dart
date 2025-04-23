import 'package:dragonwilds_companion/classes/quest/quest.dart';
import 'package:dragonwilds_companion/screens/quest_detail_screen.dart';
import 'package:dragonwilds_companion/utils/utils.dart';
import 'package:flutter/material.dart';

Map<String, String> quests = {
  'main': 'assets/data/quests/main_quests.json',
  'side': 'assets/data/quests/side_quests.json',
};

Future<List<Quest>> loadMainQuests(type) async {
  final jsonData = await loadJsonList(quests[type]!);
  return jsonData.map((quest) => Quest.fromJson(quest)).toList();
}

class QuestListScreen extends StatelessWidget {
  const QuestListScreen({super.key, required this.type, required this.title});
  // type can be 'main' or 'side'
  final String type;
  final String title;
  Future<List<Quest>> _fetchQuests() async {
    return await loadMainQuests(type);
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
              title: Text(title),
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
