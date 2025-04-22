// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Quest _$QuestFromJson(Map<String, dynamic> json) => _Quest(
      name: json['name'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      type: $enumDecodeNullable(_$QuestTypeEnumMap, json['type']),
      location: json['location'] as String?,
      region: json['region'] as String?,
      world: json['world'] as String?,
      rewards:
          (json['rewards'] as List<dynamic>?)?.map((e) => e as String).toList(),
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Quest.fromJson(e as Map<String, dynamic>))
          .toList(),
      completed: json['completed'] as bool? ?? false,
    );

Map<String, dynamic> _$QuestToJson(_Quest instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'type': _$QuestTypeEnumMap[instance.type],
      'location': instance.location,
      'region': instance.region,
      'world': instance.world,
      'rewards': instance.rewards,
      'steps': instance.steps,
      'completed': instance.completed,
    };

const _$QuestTypeEnumMap = {
  QuestType.main: 'main',
  QuestType.side: 'side',
};
