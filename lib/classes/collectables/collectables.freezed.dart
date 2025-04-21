// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collectables.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Collectable {
  String get name;
  String? get description;
  String? get image;
  CollectableType? get type;
  Collection get collection;
  String? get location;
  String? get region;
  bool get completed;

  /// Create a copy of Collectable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CollectableCopyWith<Collectable> get copyWith =>
      _$CollectableCopyWithImpl<Collectable>(this as Collectable, _$identity);

  /// Serializes this Collectable to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Collectable &&
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
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, image, type,
      collection, location, region, completed);

  @override
  String toString() {
    return 'Collectable(name: $name, description: $description, image: $image, type: $type, collection: $collection, location: $location, region: $region, completed: $completed)';
  }
}

/// @nodoc
abstract mixin class $CollectableCopyWith<$Res> {
  factory $CollectableCopyWith(
          Collectable value, $Res Function(Collectable) _then) =
      _$CollectableCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String? description,
      String? image,
      CollectableType? type,
      Collection collection,
      String? location,
      String? region,
      bool completed});
}

/// @nodoc
class _$CollectableCopyWithImpl<$Res> implements $CollectableCopyWith<$Res> {
  _$CollectableCopyWithImpl(this._self, this._then);

  final Collectable _self;
  final $Res Function(Collectable) _then;

  /// Create a copy of Collectable
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
    Object? completed = null,
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
              as CollectableType?,
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
      completed: null == completed
          ? _self.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Collectable implements Collectable {
  _Collectable(
      {required this.name,
      this.description,
      this.image,
      this.type,
      this.collection = Collection.none,
      this.location,
      this.region,
      this.completed = false});
  factory _Collectable.fromJson(Map<String, dynamic> json) =>
      _$CollectableFromJson(json);

  @override
  final String name;
  @override
  final String? description;
  @override
  final String? image;
  @override
  final CollectableType? type;
  @override
  @JsonKey()
  final Collection collection;
  @override
  final String? location;
  @override
  final String? region;
  @override
  @JsonKey()
  final bool completed;

  /// Create a copy of Collectable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CollectableCopyWith<_Collectable> get copyWith =>
      __$CollectableCopyWithImpl<_Collectable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CollectableToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Collectable &&
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
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, image, type,
      collection, location, region, completed);

  @override
  String toString() {
    return 'Collectable(name: $name, description: $description, image: $image, type: $type, collection: $collection, location: $location, region: $region, completed: $completed)';
  }
}

/// @nodoc
abstract mixin class _$CollectableCopyWith<$Res>
    implements $CollectableCopyWith<$Res> {
  factory _$CollectableCopyWith(
          _Collectable value, $Res Function(_Collectable) _then) =
      __$CollectableCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String? description,
      String? image,
      CollectableType? type,
      Collection collection,
      String? location,
      String? region,
      bool completed});
}

/// @nodoc
class __$CollectableCopyWithImpl<$Res> implements _$CollectableCopyWith<$Res> {
  __$CollectableCopyWithImpl(this._self, this._then);

  final _Collectable _self;
  final $Res Function(_Collectable) _then;

  /// Create a copy of Collectable
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
    Object? completed = null,
  }) {
    return _then(_Collectable(
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
              as CollectableType?,
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
      completed: null == completed
          ? _self.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
