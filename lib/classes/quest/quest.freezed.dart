// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Quest {
  String get id;
  String get name;
  String? get description;
  String? get image;
  QuestType? get type;
  String? get location;
  String? get region;
  String? get world;
  List<String>? get rewards;
  List<Quest>? get steps;

  /// Create a copy of Quest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QuestCopyWith<Quest> get copyWith =>
      _$QuestCopyWithImpl<Quest>(this as Quest, _$identity);

  /// Serializes this Quest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Quest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.world, world) || other.world == world) &&
            const DeepCollectionEquality().equals(other.rewards, rewards) &&
            const DeepCollectionEquality().equals(other.steps, steps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      image,
      type,
      location,
      region,
      world,
      const DeepCollectionEquality().hash(rewards),
      const DeepCollectionEquality().hash(steps));

  @override
  String toString() {
    return 'Quest(id: $id, name: $name, description: $description, image: $image, type: $type, location: $location, region: $region, world: $world, rewards: $rewards, steps: $steps)';
  }
}

/// @nodoc
abstract mixin class $QuestCopyWith<$Res> {
  factory $QuestCopyWith(Quest value, $Res Function(Quest) _then) =
      _$QuestCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String? image,
      QuestType? type,
      String? location,
      String? region,
      String? world,
      List<String>? rewards,
      List<Quest>? steps});
}

/// @nodoc
class _$QuestCopyWithImpl<$Res> implements $QuestCopyWith<$Res> {
  _$QuestCopyWithImpl(this._self, this._then);

  final Quest _self;
  final $Res Function(Quest) _then;

  /// Create a copy of Quest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? type = freezed,
    Object? location = freezed,
    Object? region = freezed,
    Object? world = freezed,
    Object? rewards = freezed,
    Object? steps = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
              as QuestType?,
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
      rewards: freezed == rewards
          ? _self.rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      steps: freezed == steps
          ? _self.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Quest>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Quest extends Quest {
  _Quest(
      {required this.id,
      required this.name,
      this.description,
      this.image,
      this.type,
      this.location,
      this.region,
      this.world,
      final List<String>? rewards,
      final List<Quest>? steps})
      : _rewards = rewards,
        _steps = steps,
        super._();
  factory _Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? image;
  @override
  final QuestType? type;
  @override
  final String? location;
  @override
  final String? region;
  @override
  final String? world;
  final List<String>? _rewards;
  @override
  List<String>? get rewards {
    final value = _rewards;
    if (value == null) return null;
    if (_rewards is EqualUnmodifiableListView) return _rewards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Quest>? _steps;
  @override
  List<Quest>? get steps {
    final value = _steps;
    if (value == null) return null;
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of Quest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$QuestCopyWith<_Quest> get copyWith =>
      __$QuestCopyWithImpl<_Quest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$QuestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Quest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.world, world) || other.world == world) &&
            const DeepCollectionEquality().equals(other._rewards, _rewards) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      image,
      type,
      location,
      region,
      world,
      const DeepCollectionEquality().hash(_rewards),
      const DeepCollectionEquality().hash(_steps));

  @override
  String toString() {
    return 'Quest(id: $id, name: $name, description: $description, image: $image, type: $type, location: $location, region: $region, world: $world, rewards: $rewards, steps: $steps)';
  }
}

/// @nodoc
abstract mixin class _$QuestCopyWith<$Res> implements $QuestCopyWith<$Res> {
  factory _$QuestCopyWith(_Quest value, $Res Function(_Quest) _then) =
      __$QuestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String? image,
      QuestType? type,
      String? location,
      String? region,
      String? world,
      List<String>? rewards,
      List<Quest>? steps});
}

/// @nodoc
class __$QuestCopyWithImpl<$Res> implements _$QuestCopyWith<$Res> {
  __$QuestCopyWithImpl(this._self, this._then);

  final _Quest _self;
  final $Res Function(_Quest) _then;

  /// Create a copy of Quest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? type = freezed,
    Object? location = freezed,
    Object? region = freezed,
    Object? world = freezed,
    Object? rewards = freezed,
    Object? steps = freezed,
  }) {
    return _then(_Quest(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
              as QuestType?,
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
      rewards: freezed == rewards
          ? _self._rewards
          : rewards // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      steps: freezed == steps
          ? _self._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<Quest>?,
    ));
  }
}

// dart format on
