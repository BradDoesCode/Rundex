import 'package:dragonwilds_companion/classes/provider/completed_items.dart';
import 'package:dragonwilds_companion/classes/quest/quest.dart';
import 'package:dragonwilds_companion/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckBox extends ConsumerWidget {
  const CheckBox({super.key, required this.quest});
  final Quest quest;

  Future<bool> isChecked(ref) async {
    //return false;
    return await ref.read(completedItemsProvider.notifier).isCompleted(
        quest.id,
        (quest.type == QuestType.main)
            ? CompletedItemType.mainQuest
            : CompletedItemType.sideQuest);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watch = ref.watch(completedItemsProvider);
    return FutureBuilder(
        future: isChecked(ref),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData) {
            return CustomCheckBox(
              isChecked: snapshot.data!,
              quest: quest,
            );
          } else {
            return Text('No data available');
          }
        });
  }
}

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.isChecked, required this.quest});
  final bool isChecked;
  final Quest quest;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Mark as ${isChecked ? 'in' : ''}complete'),
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            if (value!) {
              //
            }
          },
          activeColor: MaterialTheme(TextTheme()).light().colorScheme.primary,
          checkColor: Theme.of(context).colorScheme.onPrimary,
          fillColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ],
    );
  }
}
