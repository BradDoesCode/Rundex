import 'package:dragonwilds_companion/utils/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'completed_items.g.dart';

@riverpod
class CompletedItems extends _$CompletedItems {
  @override
  Future<Map<String, List<String>>> build() async {
    Map<String, List<String>> data =
        (await HiveStorage().getBoxContentsAsMap(HiveStorage.completedBox)).cast<String, List<String>>();
    return data;
  }

  Future<void> addToCompletedItems(String id, CompletedItemType type) async {
    final prestate = await future;
    final List<String> completedItems = prestate[type.hiveKey] ?? [];
    if (completedItems.contains(id)) {
      return;
    }
    state = AsyncData({
      ...prestate,
      type.hiveKey: completedItems..add(id),
    });
  }

  Future<void> removeFromCompletedItems(String id, CompletedItemType type) async {
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

  Future<void> clear() async {
    await HiveStorage().clear(HiveStorage.mainQuestKey);
    await HiveStorage().clear(HiveStorage.sideQuestKey);
    state = const AsyncData({});
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
