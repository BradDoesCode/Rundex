import 'package:dragonwilds_companion/classes/collectibles/collectibles.dart';
import 'package:dragonwilds_companion/classes/provider/completed_items.dart';
import 'package:dragonwilds_companion/classes/quest/quest.dart';
import 'package:dragonwilds_companion/screens/home_screen.dart';
import 'package:dragonwilds_companion/theme.dart';
import 'package:dragonwilds_companion/utils/utils.dart';
import 'package:dragonwilds_companion/widgets/drawer.dart';
import 'package:dragonwilds_companion/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

late final List<Quest> kMainQuests;
late final List<Quest> kSideQuests;
late final List<Collectible> kLoreScraps;

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Hive.initFlutter();
  kMainQuests = await loadQuests(QuestType.main);
  kSideQuests = await loadQuests(QuestType.side);
  kLoreScraps = await loadLoreScraps();
  FlutterNativeSplash.remove();
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
              TotalProgress(),
              Stack(
                children: [
                  WelcomeBack(),
                  Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: 150),
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
      height: 150,
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

class TotalProgress extends ConsumerWidget {
  const TotalProgress({super.key});

  int calculateTotal(Map<String, List<String>> completedItems) {
    int allItems = kMainQuests.fold<int>(0, (int sum, quest) {
          return sum + (quest.steps?.length ?? 0);
        }) +
        kSideQuests.fold<int>(0, (int sum, quest) {
          return sum + (quest.steps?.length ?? 0);
        }) +
        kLoreScraps.length;
    int completed = completedItems.values.fold<int>(0, (int sum, list) {
      return sum + list.length;
    });
    return completionPercentage(completed, allItems);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedItems = ref.watch(completedItemsProvider).value;
    final percent = calculateTotal(completedItems ?? {});
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Your Adventure',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w400, fontSize: 20, color: Colors.white),
          ),
          const SizedBox(height: 4),
          ProgressBar(progress: percent),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '$percent%',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Future<List<Quest>> loadQuests(QuestType type) async {
  final jsonData = await loadJsonList(
    type == QuestType.main
        ? 'assets/data/quests/main_quests.json'
        : 'assets/data/quests/side_quests.json',
  );
  return jsonData.map((quest) {
    return Quest.fromJson(quest).addType(type);
  }).toList();
}

Future<List<Collectible>> loadLoreScraps() async {
  final data = await loadJsonList('assets/data/collectibles/lore_scraps.json');
  return data.map((e) => Collectible.fromJson(e)).toList();
}
