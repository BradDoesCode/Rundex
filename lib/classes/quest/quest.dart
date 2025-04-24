import 'package:freezed_annotation/freezed_annotation.dart';

part 'quest.freezed.dart';
part 'quest.g.dart';

enum QuestType { main, side }

@freezed
sealed class Quest with _$Quest {
  const Quest._();
  factory Quest({
    required String id,
    required String name,
    String? description,
    String? image,
    QuestType? type,
    String? location,
    String? region,
    String? world,
    List<String>? rewards,
    List<Quest>? steps,
  }) = _Quest;

  factory Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);

  Quest inheritType(QuestType parentType) {
    return copyWith(
      type: type ?? parentType,
      steps: steps?.map((step) => step.inheritType(parentType)).toList(),
    );
  }
}
