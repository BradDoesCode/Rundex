import 'package:dragonwilds_companion/classes/provider/completed_items.dart';
import 'package:dragonwilds_companion/classes/quest/quest.dart';
import 'package:dragonwilds_companion/main.dart';
import 'package:dragonwilds_companion/screens/quest_detail_screen.dart';
import 'package:dragonwilds_companion/utils/utils.dart';
import 'package:dragonwilds_companion/widgets/check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestListScreen extends StatelessWidget {
  const QuestListScreen({super.key, required this.type, required this.title});
  final QuestType type;
  final String title;

  @override
  Widget build(BuildContext context) {
    final quests = type == QuestType.main ? kMainQuests : kSideQuests;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Theme.of(context).colorScheme.primary,
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
  ConsumerState<QuestCompletedCheckBox> createState() =>
      _QuestCompletedCheckBoxState();
}

class _QuestCompletedCheckBoxState
    extends ConsumerState<QuestCompletedCheckBox> {
  @override
  Widget build(BuildContext context) {
    final values = ref.watch(completedItemsProvider);
    print(values);
    return FutureBuilder<bool>(
      future:
          isQuestComplete(widget.quest, ref), // Call the async function here
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
                saveStepsToCompletedItems(
                    widget.quest.steps!, widget.quest.type!, ref);
              } else {
                removeFromCompletedItems(
                    widget.quest.steps!, widget.quest.type!, ref);
              }
              return null;
            },
          );
        }
      },
    );
  }
}
