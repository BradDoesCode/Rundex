import 'dart:ui';

import 'package:dragonwilds_companion/classes/provider/completed_items.dart';
import 'package:dragonwilds_companion/classes/quest/quest.dart';
import 'package:dragonwilds_companion/classes/step/step.dart' as cs;
import 'package:dragonwilds_companion/screens/quest_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestDetailScreen extends ConsumerWidget {
  const QuestDetailScreen({super.key, required this.quest});
  final Quest quest;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quest.name),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              quest.description ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: quest.steps?.length,
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
    );
  }
}

class StepContainer extends StatelessWidget {
  const StepContainer({super.key, required this.step, required this.questType});
  final cs.Step step;
  final QuestType questType;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(child: Text(step.name)),
          IsCompletedButton(
              itemIds: [step.id],
              type: questType == QuestType.main
                  ? CompletedItemType.mainQuest
                  : CompletedItemType.sideQuest) // Error indicator
        ],
      ),
      subtitle: SpoilerContainer(
        child: Text(step.description ?? ''),
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
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Stack(
            children: [
              widget.child,
              if (!showContent)
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.1),
                  ),
                ),
              if (!showContent)
                Positioned.fill(
                  child: Center(
                    child: Text(
                      'Tap to reveal',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
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
