// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collectables.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Collectable _$CollectableFromJson(Map<String, dynamic> json) => _Collectable(
      name: json['name'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      type: $enumDecodeNullable(_$CollectableTypeEnumMap, json['type']),
      collection:
          $enumDecodeNullable(_$CollectionEnumMap, json['collection']) ??
              Collection.none,
      location: json['location'] as String?,
      region: json['region'] as String?,
      completed: json['completed'] as bool? ?? false,
    );

Map<String, dynamic> _$CollectableToJson(_Collectable instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'type': _$CollectableTypeEnumMap[instance.type],
      'collection': _$CollectionEnumMap[instance.collection]!,
      'location': instance.location,
      'region': instance.region,
      'completed': instance.completed,
    };

const _$CollectableTypeEnumMap = {
  CollectableType.book: 'book',
  CollectableType.recipe: 'recipe',
};

const _$CollectionEnumMap = {
  Collection.none: 'none',
  Collection.dragonAttack: 'dragonAttack',
  Collection.goblin: 'goblin',
  Collection.guthix: 'guthix',
  Collection.garou: 'garou',
  Collection.dragonkin: 'dragonkin',
  Collection.abyssal: 'abyssal',
  Collection.castle: 'castle',
  Collection.cathan: 'cathan',
  Collection.quest: 'quest',
};
