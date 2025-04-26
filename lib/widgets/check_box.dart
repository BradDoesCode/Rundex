import 'package:dragonwilds_companion/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomCheckBox extends ConsumerWidget {
  const CustomCheckBox({super.key, required this.isChecked, required this.onChanged});
  final bool isChecked;
  final bool? Function(bool) onChanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Text('Mark as ${isChecked ? 'in' : ''}complete'),
        Checkbox(
          value: isChecked,
          onChanged: (value) => onChanged(value ?? false),
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
