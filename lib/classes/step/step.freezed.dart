// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Step {
  String get id;
  String get name;
  String? get description;
  String? get image;
  String? get location;
  String? get region;
  String? get world;
  List<String>? get rewards;

  /// Create a copy of Step
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StepCopyWith<Step> get copyWith =>
      _$StepCopyWithImpl<Step>(this as Step, _$identity);

  /// Serializes this Step to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Step &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.world, world) || other.world == world) &&
            const DeepCollectionEquality().equals(other.rewards, rewards));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, image,
      location, region, world, const DeepCollectionEquality().hash(rewards));

  @override
  String toString() {
    return 'Step(id: $id, name: $name, description: $description, image: $image, location: $location, region: $region, world: $world, rewards: $rewards)';
  }
}

/// @nodoc
abstract mixin class $StepCopyWith<$Res> {
  factory $StepCopyWith(Step value, $Res Function(Step) _then) =
      _$StepCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String? image,
      String? location,
      String? region,
      String? world,
      List<String>? rewards});
}

/// @nodoc
class _$StepCopyWithImpl<$Res> implements $StepCopyWith<$Res> {
  _$StepCopyWithImpl(this._self, this._then);

  final Step _self;
  final $Res Function(Step) _then;

  /// Create a copy of Step
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? location = freezed,
    Object? region = freezed,
    Object? world = freezed,
    Object? rewards = freezed,
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Step extends Step {
  _Step(
      {required this.id,
      required this.name,
      this.description,
      this.image,
      this.location,
      this.region,
      this.world,
      final List<String>? rewards})
      : _rewards = rewards,
        super._();
  factory _Step.fromJson(Map<String, dynamic> json) => _$StepFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String? image;
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

  /// Create a copy of Step
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StepCopyWith<_Step> get copyWith =>
      __$StepCopyWithImpl<_Step>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StepToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Step &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.world, world) || other.world == world) &&
            const DeepCollectionEquality().equals(other._rewards, _rewards));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, image,
      location, region, world, const DeepCollectionEquality().hash(_rewards));

  @override
  String toString() {
    return 'Step(id: $id, name: $name, description: $description, image: $image, location: $location, region: $region, world: $world, rewards: $rewards)';
  }
}

/// @nodoc
abstract mixin class _$StepCopyWith<$Res> implements $StepCopyWith<$Res> {
  factory _$StepCopyWith(_Step value, $Res Function(_Step) _then) =
      __$StepCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      String? image,
      String? location,
      String? region,
      String? world,
      List<String>? rewards});
}

/// @nodoc
class __$StepCopyWithImpl<$Res> implements _$StepCopyWith<$Res> {
  __$StepCopyWithImpl(this._self, this._then);

  final _Step _self;
  final $Res Function(_Step) _then;

  /// Create a copy of Step
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? location = freezed,
    Object? region = freezed,
    Object? world = freezed,
    Object? rewards = freezed,
  }) {
    return _then(_Step(
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
    ));
  }
}

// dart format on
