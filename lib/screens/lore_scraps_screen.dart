import 'package:runedex/classes/collectibles/collectibles.dart';
import 'package:runedex/classes/provider/completed_items.dart';
import 'package:runedex/main.dart';
import 'package:runedex/screens/quest_detail_screen.dart';
import 'package:runedex/utils/hive.dart';
import 'package:runedex/utils/utils.dart';
import 'package:runedex/widgets/app_bar_background.dart';
import 'package:runedex/widgets/body_background.dart';
import 'package:runedex/widgets/progress_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoreScrapsScreen extends StatelessWidget {
  const LoreScrapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: AppBarBackground(),
        title: Text(
          'Lore Scraps',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.w500, fontSize: 30, color: Colors.white),
        ),
      ),
      body: BodyBackground(
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          padding: const EdgeInsets.all(16),
          itemCount: kLoreScraps.length,
          itemBuilder: (context, index) {
            return ScrapItemCard(item: kLoreScraps[index]);
          },
        ),
      ),
    );
  }
}

class ScrapItemCard extends StatelessWidget {
  const ScrapItemCard({super.key, required this.item});
  final Collectible item;

  @override
  Widget build(BuildContext context) {
    return ProgressCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(item.name,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.black)),
          ),
          SpoilerContainer(
            child: ListTile(
              leading: Icon(Icons.location_on),
              title: Text("${item.location} in ${item.region}"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () async {
                    if (item.webLink == null) {
                      return;
                    }
                    final url = Uri.parse(item.webLink!);
                    await launchWeb(url);
                  },
                  child: Text('View on map genie'),
                ),
                CollectibleFoundButton(item: item),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CollectibleFoundButton extends ConsumerWidget {
  const CollectibleFoundButton({super.key, required this.item});
  final Collectible item;
  @override
  Widget build(BuildContext context, ref) {
    final completedItems =
        ref.watch(completedItemsProvider).value?[HiveStorage.loreScrapKey];
    final isCompleted = completedItems?.contains(item.id) ?? false;
    return FilledButton(
      onPressed: () {
        if (isCompleted) {
          ref
              .read(completedItemsProvider.notifier)
              .removeFromCompletedItems([item.id], CompletedItemType.loreScrap);
          return;
        }
        ref
            .read(completedItemsProvider.notifier)
            .addToCompletedItems([item.id], CompletedItemType.loreScrap);
      },
      child: Text('Mark as ${isCompleted ? 'not' : ''} found'),
    );
  }
}
