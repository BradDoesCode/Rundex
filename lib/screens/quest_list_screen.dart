import 'package:dragonwilds_companion/classes/provider/completed_items.dart';
import 'package:dragonwilds_companion/classes/quest/quest.dart';
import 'package:dragonwilds_companion/screens/quest_detail_screen.dart';
import 'package:dragonwilds_companion/utils/utils.dart';
import 'package:dragonwilds_companion/widgets/check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Map<String, String> quests = {
  'main': 'assets/data/quests/main_quests.json',
  'side': 'assets/data/quests/side_quests.json',
};

Future<List<Quest>> loadMainQuests(String type) async {
  final jsonData = await loadJsonList(quests[type]!);
  final questType = type == 'main' ? QuestType.main : QuestType.side;
  final loaded = jsonData.map((quest) {
    return Quest.fromJson(quest).addType(questType);
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
          );
        }
      },
    );
  }
}

class QuestCard extends ConsumerWidget {
  const QuestCard({super.key, required this.quest});
  final Quest quest;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              QuestCompletedCheckBox(
                quest: quest,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class QuestCompletedCheckBox extends ConsumerStatefulWidget {
  const QuestCompletedCheckBox({super.key, required this.quest});
  final Quest quest;
  @override
  ConsumerState<QuestCompletedCheckBox> createState() => _QuestCompletedCheckBoxState();
}

class _QuestCompletedCheckBoxState extends ConsumerState<QuestCompletedCheckBox> {
  @override
  Widget build(BuildContext context) {
    final values = ref.watch(completedItemsProvider);
    print(values);
    return FutureBuilder<bool>(
      future: isQuestComplete(widget.quest, ref), // Call the async function here
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for the result
          return Checkbox(value: false, onChanged: (value) {});
        } else if (snapshot.hasError) {
          // Handle errors
          return ListTile(
            title: Row(
              children: [
                const Icon(Icons.error, color: Colors.red), // Error indicator
              ],
            ),
          );
        } else {
          final isChecked = snapshot.data ?? false;
          return CustomCheckBox(
            isChecked: isChecked,
            onChanged: (value) {
              if (value) {
                saveStepsToCompletedItems(widget.quest.steps!, widget.quest.type!, ref);
              } else {
                removeFromCompletedItems(widget.quest.steps!, widget.quest.type!, ref);
              }
              return null;
            },
          );
        }
      },
    );
  }
}
