// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collectibles.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Collectible {
  String get name;
  String? get description;
  String? get image;
  CollectibleType? get type;
  Collection get collection;
  String? get location;
  String? get region;
  String? get world;
  String? get webLink;

  /// Create a copy of Collectible
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CollectibleCopyWith<Collectible> get copyWith =>
      _$CollectibleCopyWithImpl<Collectible>(this as Collectible, _$identity);

  /// Serializes this Collectible to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Collectible &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.world, world) || other.world == world) &&
            (identical(other.webLink, webLink) || other.webLink == webLink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, image, type,
      collection, location, region, world, webLink);

  @override
  String toString() {
    return 'Collectible(name: $name, description: $description, image: $image, type: $type, collection: $collection, location: $location, region: $region, world: $world, webLink: $webLink)';
  }
}

/// @nodoc
abstract mixin class $CollectibleCopyWith<$Res> {
  factory $CollectibleCopyWith(
          Collectible value, $Res Function(Collectible) _then) =
      _$CollectibleCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String? description,
      String? image,
      CollectibleType? type,
      Collection collection,
      String? location,
      String? region,
      String? world,
      String? webLink});
}

/// @nodoc
class _$CollectibleCopyWithImpl<$Res> implements $CollectibleCopyWith<$Res> {
  _$CollectibleCopyWithImpl(this._self, this._then);

  final Collectible _self;
  final $Res Function(Collectible) _then;

  /// Create a copy of Collectible
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? type = freezed,
    Object? collection = null,
    Object? location = freezed,
    Object? region = freezed,
    Object? world = freezed,
    Object? webLink = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as CollectibleType?,
      collection: null == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Collection,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      world: freezed == world
          ? _self.world
          : world // ignore: cast_nullable_to_non_nullable
              as String?,
      webLink: freezed == webLink
          ? _self.webLink
          : webLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Collectible implements Collectible {
  _Collectible(
      {required this.name,
      this.description,
      this.image,
      this.type,
      this.collection = Collection.none,
      this.location,
      this.region,
      this.world,
      this.webLink});
  factory _Collectible.fromJson(Map<String, dynamic> json) =>
      _$CollectibleFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  @override
  final String? image;
  @override
  final CollectibleType? type;
  @override
  @JsonKey()
  final Collection collection;
  @override
  final String? location;
  @override
  final String? region;
  @override
  final String? world;
  @override
  final String? webLink;

  /// Create a copy of Collectible
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CollectibleCopyWith<_Collectible> get copyWith =>
      __$CollectibleCopyWithImpl<_Collectible>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CollectibleToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Collectible &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.world, world) || other.world == world) &&
            (identical(other.webLink, webLink) || other.webLink == webLink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, image, type,
      collection, location, region, world, webLink);

  @override
  String toString() {
    return 'Collectible(name: $name, description: $description, image: $image, type: $type, collection: $collection, location: $location, region: $region, world: $world, webLink: $webLink)';
  }
}

/// @nodoc
abstract mixin class _$CollectibleCopyWith<$Res>
    implements $CollectibleCopyWith<$Res> {
  factory _$CollectibleCopyWith(
          _Collectible value, $Res Function(_Collectible) _then) =
      __$CollectibleCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String? description,
      String? image,
      CollectibleType? type,
      Collection collection,
      String? location,
      String? region,
      String? world,
      String? webLink});
}

/// @nodoc
class __$CollectibleCopyWithImpl<$Res> implements _$CollectibleCopyWith<$Res> {
  __$CollectibleCopyWithImpl(this._self, this._then);

  final _Collectible _self;
  final $Res Function(_Collectible) _then;

  /// Create a copy of Collectible
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? type = freezed,
    Object? collection = null,
    Object? location = freezed,
    Object? region = freezed,
    Object? world = freezed,
    Object? webLink = freezed,
  }) {
    return _then(_Collectible(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _self.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as CollectibleType?,
      collection: null == collection
          ? _self.collection
          : collection // ignore: cast_nullable_to_non_nullable
              as Collection,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      region: freezed == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String?,
      world: freezed == world
          ? _self.world
          : world // ignore: cast_nullable_to_non_nullable
              as String?,
      webLink: freezed == webLink
          ? _self.webLink
          : webLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
