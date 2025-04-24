import 'package:dragonwilds_companion/classes/quest/quest.dart';
import 'package:dragonwilds_companion/theme.dart';
import 'package:dragonwilds_companion/utils/utils.dart';
import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({super.key, required this.quest});
  final Quest quest;
  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Mark as ${isChecked ? 'in' : ''}complete'),
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false;
            });
            if (value!) {
              addQuestsToComplete(widget.quest);
            } else 
            {
              
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
