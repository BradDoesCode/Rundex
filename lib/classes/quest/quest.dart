import 'package:freezed_annotation/freezed_annotation.dart';

part 'quest.freezed.dart';
part 'quest.g.dart';

enum QuestType {
  main, side
}

@freezed
sealed class Quest with _$Quest {
  factory Quest({
    required String name,
    String? description,
    String? image,
    QuestType? type,
    String? location,
    String? region,
    List<String>? rewards,
    List<Quest>? steps,
    @Default(false) bool completed,
  }) = _Quest;

  factory Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);
}
