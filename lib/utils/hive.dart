import 'package:hive_flutter/hive_flutter.dart';

class HiveStorage {
  static const String completedBox = 'completed_box';
  static const String mainQuestKey = 'main_quests';
  static const String sideQuestKey = 'side_quests';
  static const String loreScrapKey = 'lore_scrap';

  Future<Box> openBox(String boxName) async {
    return await Hive.openBox(boxName);
  }

  Future<void> put(String boxName, String key, dynamic value) async {
    final box = await openBox(boxName);
    await box.put(key, value);
  }

  Future<void> removeKey(String boxName, String key) async {
    final box = await openBox(boxName);
    await box.delete(key);
  }

  Future<dynamic> get(String boxName, String key) async {
    final box = await openBox(boxName);
    final value = box.get(key);
    return value;
  }

  Future<List<Map<String, dynamic>>> getBoxContents(String boxName) async {
    final box = await openBox(boxName);
    final result = box.toMap().map((k, e) {
      return MapEntry(
        k.toString(),
        e is Map ? Map<String, dynamic>.from(e) : <String, dynamic>{},
      );
    });
    return result.values.toList();
  }

  Future<Map<String, dynamic>> getBoxContentsAsMap(String boxName) async {
    final box = await openBox(boxName);
    final data = box.toMap().map((k, e) {
      return MapEntry(k.toString(), e);
    });
    return data;
  }

  Future<void> delete(String boxName, String key) async {
    final box = await openBox(boxName);
    await box.delete(key);
  }

  Future<void> clear(String boxName) async {
    final box = await openBox(boxName);
    await box.clear();
  }

  Future<void> deleteBox(String boxName) async {
    await Hive.deleteBoxFromDisk(boxName);
  }

  Future<void> deleteAllBoxes() async {
    await Hive.deleteFromDisk();
  }
}
