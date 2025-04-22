import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  const ProgressCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image,
      this.onTap});
  final String title;
  final String subtitle;
  final Widget image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
          child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: image),
            SizedBox(height: 8),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      )),
    );
  }
}
