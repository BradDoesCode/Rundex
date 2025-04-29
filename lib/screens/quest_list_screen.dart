import 'package:dragonwilds_companion/classes/provider/completed_items.dart';
import 'package:dragonwilds_companion/classes/quest/quest.dart';
import 'package:dragonwilds_companion/main.dart';
import 'package:dragonwilds_companion/screens/quest_detail_screen.dart';
import 'package:dragonwilds_companion/widgets/app_bar_background.dart';
import 'package:dragonwilds_companion/widgets/body_background.dart';
import 'package:dragonwilds_companion/widgets/progress_card.dart';
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
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: AppBarBackground(),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.w500, fontSize: 30, color: Colors.white),
        ),
      ),
      body: BodyBackground(
        child: ListView.separated(
          padding: EdgeInsets.all(16),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: quests.length,
          itemBuilder: (context, index) {
            final quest = quests[index];
            return QuestCard(
              quest: quest,
            );
          },
        ),
      ),
    );
  }
}

class QuestCard extends StatelessWidget {
  const QuestCard({super.key, required this.quest});
  final Quest quest;
  @override
  Widget build(BuildContext context) {
    return ProgressCard(
      child: Column(
        children: [
          ListTile(
            title: Text(quest.name,
                style: Theme.of(context).textTheme.headlineSmall),
            subtitle: quest.description != null
                ? Text(
                    quest.description!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                : null,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IsCompletedButton(
                  itemIds: quest.steps?.map((e) => e.id).toList() ?? [],
                  type: quest.type! == QuestType.main
                      ? CompletedItemType.mainQuest
                      : CompletedItemType.sideQuest,
                ),
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
        child: Text("Mark as ${isCompleted ? '' : 'in'}complete"));
  }
}
