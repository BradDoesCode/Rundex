import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:runedex/classes/collectibles/collectibles.dart';
import 'package:runedex/classes/quest/quest.dart';
import 'package:runedex/screens/home_screen.dart';
import 'package:runedex/theme.dart';
import 'package:runedex/utils/utils.dart';
import 'package:runedex/widgets/app_bar_background.dart';
import 'package:runedex/widgets/drawer.dart';

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
        flexibleSpace: AppBarBackground(),
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
      body: HomeScreen(),
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
