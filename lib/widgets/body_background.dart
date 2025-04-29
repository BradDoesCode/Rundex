import 'package:flutter/material.dart';

class BodyBackground extends StatelessWidget {
  const BodyBackground({super.key, required this.child});
  final Widget child;
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
      child: child,
    );
  }
}
