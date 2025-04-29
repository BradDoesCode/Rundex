import 'dart:ui';

import 'package:dragonwilds_companion/classes/provider/completed_items.dart';
import 'package:dragonwilds_companion/classes/quest/quest.dart';
import 'package:dragonwilds_companion/classes/step/step.dart' as cs;
import 'package:dragonwilds_companion/screens/quest_list_screen.dart';
import 'package:dragonwilds_companion/widgets/app_bar_background.dart';
import 'package:dragonwilds_companion/widgets/body_background.dart';
import 'package:dragonwilds_companion/widgets/progress_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestDetailScreen extends ConsumerWidget {
  const QuestDetailScreen({super.key, required this.quest});
  final Quest quest;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: AppBarBackground(),
        title: Text(
          quest.name,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.w500, fontSize: 30, color: Colors.white),
        ),
      ),
      body: BodyBackground(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                quest.description ?? '',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(16),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: quest.steps!.length,
                itemBuilder: (context, index) {
                  return StepContainer(
                    step: quest.steps![index],
                    questType: quest.type!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StepContainer extends StatelessWidget {
  const StepContainer({super.key, required this.step, required this.questType});
  final cs.Step step;
  final QuestType questType;

  @override
  Widget build(BuildContext context) {
    return ProgressCard(
      child: ListTile(
        title: Row(
          children: [
            Expanded(
                child: Text(
              step.name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            )), // Error indicator
          ],
        ),
        subtitle: Column(
          children: [
            SizedBox(height: 8),
            SpoilerContainer(
              child: Text(
                step.description ?? '',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IsCompletedButton(
                  itemIds: [step.id],
                  type: questType == QuestType.main
                      ? CompletedItemType.mainQuest
                      : CompletedItemType.sideQuest,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SpoilerContainer extends StatefulWidget {
  const SpoilerContainer({super.key, required this.child});
  final Widget child;

  @override
  State<SpoilerContainer> createState() => _SpoilerContainerState();
}

class _SpoilerContainerState extends State<SpoilerContainer> {
  bool showContent = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showContent = !showContent;
        });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Stack(
            children: [
              widget.child,
              if (!showContent)
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                  child: Container(),
                ),
              if (!showContent)
                Positioned.fill(
                  child: Center(
                    child: Text(
                      'Tap to reveal',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
