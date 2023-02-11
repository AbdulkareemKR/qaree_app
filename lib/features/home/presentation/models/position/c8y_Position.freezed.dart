// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'c8y_Position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

C8y_Position _$C8y_PositionFromJson(Map<String, dynamic> json) {
  return _C8y_Position.fromJson(json);
}

/// @nodoc
mixin _$C8y_Position {
  double get lng => throw _privateConstructorUsedError;
  double get lat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $C8y_PositionCopyWith<C8y_Position> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $C8y_PositionCopyWith<$Res> {
  factory $C8y_PositionCopyWith(
          C8y_Position value, $Res Function(C8y_Position) then) =
      _$C8y_PositionCopyWithImpl<$Res, C8y_Position>;
  @useResult
  $Res call({double lng, double lat});
}

/// @nodoc
class _$C8y_PositionCopyWithImpl<$Res, $Val extends C8y_Position>
    implements $C8y_PositionCopyWith<$Res> {
  _$C8y_PositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lng = null,
    Object? lat = null,
  }) {
    return _then(_value.copyWith(
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_C8y_PositionCopyWith<$Res>
    implements $C8y_PositionCopyWith<$Res> {
  factory _$$_C8y_PositionCopyWith(
          _$_C8y_Position value, $Res Function(_$_C8y_Position) then) =
      __$$_C8y_PositionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lng, double lat});
}

/// @nodoc
class __$$_C8y_PositionCopyWithImpl<$Res>
    extends _$C8y_PositionCopyWithImpl<$Res, _$_C8y_Position>
    implements _$$_C8y_PositionCopyWith<$Res> {
  __$$_C8y_PositionCopyWithImpl(
      _$_C8y_Position _value, $Res Function(_$_C8y_Position) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lng = null,
    Object? lat = null,
  }) {
    return _then(_$_C8y_Position(
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_C8y_Position implements _C8y_Position {
  _$_C8y_Position({required this.lng, required this.lat});

  factory _$_C8y_Position.fromJson(Map<String, dynamic> json) =>
      _$$_C8y_PositionFromJson(json);

  @override
  final double lng;
  @override
  final double lat;

  @override
  String toString() {
    return 'C8y_Position(lng: $lng, lat: $lat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_C8y_Position &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.lat, lat) || other.lat == lat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lng, lat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_C8y_PositionCopyWith<_$_C8y_Position> get copyWith =>
      __$$_C8y_PositionCopyWithImpl<_$_C8y_Position>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_C8y_PositionToJson(
      this,
    );
  }
}

abstract class _C8y_Position implements C8y_Position {
  factory _C8y_Position(
      {required final double lng, required final double lat}) = _$_C8y_Position;

  factory _C8y_Position.fromJson(Map<String, dynamic> json) =
      _$_C8y_Position.fromJson;

  @override
  double get lng;
  @override
  double get lat;
  @override
  @JsonKey(ignore: true)
  _$$_C8y_PositionCopyWith<_$_C8y_Position> get copyWith =>
      throw _privateConstructorUsedError;
}
