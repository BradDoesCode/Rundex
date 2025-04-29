import 'package:dragonwilds_companion/classes/provider/completed_items.dart';
import 'package:dragonwilds_companion/classes/quest/quest.dart';
import 'package:dragonwilds_companion/main.dart';
import 'package:dragonwilds_companion/screens/quest_detail_screen.dart';
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
              IsCompletedButton(
                itemIds: quest.steps?.map((e) => e.id).toList() ?? [],
                type: quest.type! == QuestType.main
                    ? CompletedItemType.mainQuest
                    : CompletedItemType.sideQuest,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IsCompletedButton extends ConsumerWidget {
  const IsCompletedButton(
      {super.key, required this.itemIds, required this.type});
  final List<String> itemIds;
  final CompletedItemType type;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completed =
        ref.watch(completedItemsProvider).value?[type.hiveKey] ?? [];
    final isCompleted = itemIds.every((item) => completed.contains(item));
    return FilledButton(
        onPressed: () {
          (isCompleted)
              ? ref
                  .read(completedItemsProvider.notifier)
                  .removeFromCompletedItems(itemIds, type)
              : ref
                  .read(completedItemsProvider.notifier)
                  .addToCompletedItems(itemIds, type);
        },
        child: Text("${isCompleted ? '' : 'in'}Complete"));
  }
}
