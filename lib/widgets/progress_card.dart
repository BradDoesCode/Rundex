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
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              image,
              TextContainer(title: title, subtitle: subtitle),
            ],
          )),
    );
  }
}

class TextContainer extends StatelessWidget {
  const TextContainer({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0, // Ensures the widget stretches horizontally within the parent
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.centerRight,
            colors: [
              Theme.of(context)
                  .colorScheme
                  .surfaceContainer
                  .withValues(alpha: 0.8),
              Theme.of(context)
                  .colorScheme
                  .surfaceContainer
                  .withValues(alpha: 0.1),
            ],
            stops: [0.5, 1.0], // 75% primaryContainer, 25% transparent
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adjusts height to fit content
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
      ),
    );
  }
}
