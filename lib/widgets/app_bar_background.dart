import 'package:flutter/material.dart';

class AppBarBackground extends StatelessWidget {
  const AppBarBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF34296D), // Start color
              Color(0xFF342496), // End color
            ],
            begin: Alignment.topLeft, // Gradient starts at the top-left
            end: Alignment.bottomRight, // Gradient ends at the bottom-right
          ),
        ),
      ),
    );
  }
}
