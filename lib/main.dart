import 'package:dragonwilds_companion/screens/home_screen.dart';
import 'package:dragonwilds_companion/theme.dart';
import 'package:dragonwilds_companion/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  Hive.initFlutter();
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Runedex',
      theme: MaterialTheme(TextTheme()).light(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      appBar: AppBar(
        backgroundColor:
            Colors.transparent, // Make the AppBar background transparent
        elevation: 0, // Optional: Remove shadow
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
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Image.asset('assets/menu.png'),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text(
          'Runedex',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontWeight: FontWeight.w500, fontSize: 30, color: Colors.white),
        ),
      ),
      drawer: DrawerMenu(),
      body: Container(
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
              Padding(
                padding: const EdgeInsets.only(left: 32.0, top: 16),
                child: Text('progress tracker goes here',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 20, color: Colors.white)),
              ),
              Stack(
                children: [
                  WelcomeBack(),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 160),
                      child: HomeScreen()),
                  OverClaw(),
                ],
              ),
            ],
          ),
        ), // Your body content
      ),
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
      height: 160,
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
                  ),
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
