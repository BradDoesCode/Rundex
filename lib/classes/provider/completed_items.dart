import 'package:dragonwilds_companion/utils/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'completed_items.g.dart';

@riverpod
class CompletedItems extends _$CompletedItems {
  @override
  Future<Map<String, List<String>>> build() async {
    return await HiveStorage().getBoxContentsAsMap(HiveStorage.completedBox)
        as Map<String, List<String>>;
  }

  Future<void> addToCompletedItems(String id, CompletedItemType type) async {
    final prestate = await future;
    final List<String> completedItems = prestate[type.hiveKey] ?? [];
    state = AsyncData({
      ...prestate,
      type.hiveKey: completedItems,
    });
  }

  Future<void> removeFromCompletedItems(
      String id, CompletedItemType type) async {
    final prestate = await future;
    final List<String> completedItems = prestate[type.hiveKey] ?? [];
    if (completedItems.contains(id)) {
      completedItems.remove(id);
      state = AsyncData({
        ...prestate,
        type.hiveKey: completedItems,
      });
    }
  }

  Future<bool> isCompleted(String id, CompletedItemType type) async {
    final prestate = await future;
    final List<String> completedItems = prestate[type.hiveKey] ?? [];
    return completedItems.contains(id);
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
