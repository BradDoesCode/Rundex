import 'package:dragonwilds_companion/classes/progression_sections/progression_sections.dart';
import 'package:dragonwilds_companion/classes/provider/completed_items.dart';
import 'package:dragonwilds_companion/widgets/progress_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedItems = ref.watch(completedItemsProvider);
    return Column(
      children: [
        for (var section in ProgressionSections.values)
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 16,
              child: ProgressCard(
                title: section.title,
                subtitle:
                    "${section.percent(completedItems.value ?? {})}% complete",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => section.screen,
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
