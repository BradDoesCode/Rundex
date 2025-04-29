import 'package:dragonwilds_companion/classes/progression_sections/progression_sections.dart';
import 'package:dragonwilds_companion/classes/provider/completed_items.dart';
import 'package:dragonwilds_companion/main.dart';
import 'package:dragonwilds_companion/utils/utils.dart';
import 'package:dragonwilds_companion/widgets/progress_bar.dart';
import 'package:dragonwilds_companion/widgets/progress_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xFF342496), // Outer color
            Color(0xFF34296D), // Inner color
          ],
          center: Alignment.center,
          radius: 1.0,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            TotalProgress(),
            Stack(
              children: [
                WelcomeBack(),
                Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, top: 150),
                    child: HomeScreenTiles()),
                OverClaw(),
              ],
            ),
          ],
        ),
      ), // Your body content
    );
  }
}

class HomeScreenTiles extends ConsumerWidget {
  const HomeScreenTiles({super.key});

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
                child: TextContainer(
                  title: section.title,
                  subtitle:
                      "${section.percent(completedItems.value ?? {})}% complete",
                ),
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

class OverClaw extends StatelessWidget {
  const OverClaw({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 3,
      right: 0,
      child: Image.asset(
        'assets/home_claw.png',
        width: MediaQuery.of(context).size.width * 0.6,
        fit: BoxFit.cover,
      ),
    );
  }
}

class WelcomeBack extends StatelessWidget {
  const WelcomeBack({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 30,
            child: Text(
              'WELCOME\nBACK,\nSLAYER!',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                  height: 1.2,
                  letterSpacing: 1.2),
            ),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: Image.asset(
                'assets/home_dragon.png',
                width: MediaQuery.of(context).size.width * 0.6,
                fit: BoxFit.cover,
              ))
        ],
      ),
    );
  }
}

class TotalProgress extends ConsumerWidget {
  const TotalProgress({super.key});

  int calculateTotal(Map<String, List<String>> completedItems) {
    int allItems = kMainQuests.fold<int>(0, (int sum, quest) {
          return sum + (quest.steps?.length ?? 0);
        }) +
        kSideQuests.fold<int>(0, (int sum, quest) {
          return sum + (quest.steps?.length ?? 0);
        }) +
        kLoreScraps.length;
    int completed = completedItems.values.fold<int>(0, (int sum, list) {
      return sum + list.length;
    });
    return completionPercentage(completed, allItems);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedItems = ref.watch(completedItemsProvider).value;
    final percent = calculateTotal(completedItems ?? {});
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Your Adventure',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 4),
          ProgressBar(progress: percent),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '$percent%',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}
