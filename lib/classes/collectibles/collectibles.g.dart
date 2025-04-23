// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collectibles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Collectible _$CollectibleFromJson(Map<String, dynamic> json) => _Collectible(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      type: $enumDecodeNullable(_$CollectibleTypeEnumMap, json['type']),
      collection:
          $enumDecodeNullable(_$CollectionEnumMap, json['collection']) ??
              Collection.none,
      location: json['location'] as String?,
      region: json['region'] as String?,
      world: json['world'] as String?,
      webLink: json['webLink'] as String?,
    );

Map<String, dynamic> _$CollectibleToJson(_Collectible instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'type': _$CollectibleTypeEnumMap[instance.type],
      'collection': _$CollectionEnumMap[instance.collection]!,
      'location': instance.location,
      'region': instance.region,
      'world': instance.world,
      'webLink': instance.webLink,
    };

const _$CollectibleTypeEnumMap = {
  CollectibleType.book: 'book',
  CollectibleType.recipe: 'recipe',
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
