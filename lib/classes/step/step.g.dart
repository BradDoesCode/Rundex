// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Step _$StepFromJson(Map<String, dynamic> json) => _Step(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      location: json['location'] as String?,
      region: json['region'] as String?,
      world: json['world'] as String?,
      rewards:
          (json['rewards'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$StepToJson(_Step instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'location': instance.location,
      'region': instance.region,
      'world': instance.world,
      'rewards': instance.rewards,
    };
