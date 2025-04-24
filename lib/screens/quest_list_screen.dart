import 'package:dragonwilds_companion/classes/provider/completed_items.dart';
import 'package:dragonwilds_companion/classes/quest/quest.dart';
import 'package:dragonwilds_companion/screens/quest_detail_screen.dart';
import 'package:dragonwilds_companion/utils/hive.dart';
import 'package:dragonwilds_companion/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Map<String, String> quests = {
  'main': 'assets/data/quests/main_quests.json',
  'side': 'assets/data/quests/side_quests.json',
};

Future<List<Quest>> loadMainQuests(String type) async {
  final jsonData = await loadJsonList(quests[type]!);
  final parentType = (type == 'main' ? QuestType.main : QuestType.side);

  final loaded = jsonData.map((quest) {
    return Quest.fromJson(quest).inheritType(parentType);
  }).toList();

  return loaded;
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
                return QuestCard(
                  quest: quest,
                );
              },
            ),
            bottomNavigationBar: ProviderList(),
          );
        }
      },
    );
  }
}

class QuestCard extends StatelessWidget {
  const QuestCard({super.key, required this.quest});
  final Quest quest;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          ListTile(
            title: Text(quest.name),
            subtitle: Text(quest.description ?? ''),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => QuestDetailScreen(quest: quest),
                ),
              );
            },
          ),
          if (quest.image != null)
            Image.asset(
              quest.image!,
              fit: BoxFit.cover,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Mark quest as completed'),
              Checkbox(
                value: false,
                onChanged: (value) {
                  addQuestsToComplete(quest);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProviderList extends ConsumerWidget {
  const ProviderList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('building');
    Map<String, List<String>>? items = ref.watch(completedItemsProvider).value;
    if (items?[HiveStorage.mainQuestKey] == null) {
      return SizedBox();
    }
    return Row(
      children: [
        for (var s in items![HiveStorage.mainQuestKey]!) Text(s),
      ],
    );
  }
}
