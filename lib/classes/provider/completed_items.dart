import 'package:dragonwilds_companion/utils/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'completed_items.g.dart';

@riverpod
class CompletedItems extends _$CompletedItems {
  @override
  Future<Map<String, List<String>>> build() async {
    ref.keepAlive();
    Map<String, List<String>> data =
        (await HiveStorage().getBoxContentsAsMap(HiveStorage.completedBox))
            .cast<String, List<String>>();
    return data;
  }

  Future<void> addToCompletedItems(
      List<String> ids, CompletedItemType type) async {
    final prestate = await future;
    final List<String> completedItems = prestate[type.hiveKey] ?? [];

    final newIds = ids.where((id) => !completedItems.contains(id)).toList();
    completedItems.addAll(newIds);
    addToHive(type.hiveKey, completedItems);
    state = AsyncData({
      ...prestate,
      type.hiveKey: completedItems,
    });
  }

  Future<void> addToHive(String key, List<String> value) async {
    await HiveStorage().put(HiveStorage.completedBox, key, value);
  }

  Future<void> removeFromCompletedItems(
      List<String> ids, CompletedItemType type) async {
    final prestate = await future;
    final List<String> completedItems = prestate[type.hiveKey] ?? [];
    completedItems.removeWhere((item) => ids.any((id) => id == item));
    addToHive(type.hiveKey, completedItems);
    state = AsyncData({
      ...prestate,
      type.hiveKey: completedItems,
    });
  }

  Future<void> clear() async {
    await HiveStorage().clear(HiveStorage.mainQuestKey);
    await HiveStorage().clear(HiveStorage.sideQuestKey);
    state = const AsyncData({});
  }

  Future<bool> isCompleted(List<String> items, CompletedItemType type) async {
    final prestate = await future;
    final List<String> completedItems = prestate[type.hiveKey] ?? [];
    return items.every((item) => completedItems.contains(item));
  }
}

enum CompletedItemType {
  mainQuest,
  sideQuest,
  loreScrap,
}

extension CompletedItemTypeExtension on CompletedItemType {
  String get hiveKey {
    switch (this) {
      case CompletedItemType.mainQuest:
        return HiveStorage.mainQuestKey;
      case CompletedItemType.sideQuest:
        return HiveStorage.sideQuestKey;
      case CompletedItemType.loreScrap:
        return HiveStorage.loreScrapKey;
    }
  }
}
