// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeviceInfo _$DeviceInfoFromJson(Map<String, dynamic> json) {
  return _DeviceInfo.fromJson(json);
}

/// @nodoc
mixin _$DeviceInfo {
  String get owner => throw _privateConstructorUsedError;
  String get creationTime => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get lastUpdated => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  C8y_Position get c8y_Position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceInfoCopyWith<DeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceInfoCopyWith<$Res> {
  factory $DeviceInfoCopyWith(
          DeviceInfo value, $Res Function(DeviceInfo) then) =
      _$DeviceInfoCopyWithImpl<$Res, DeviceInfo>;
  @useResult
  $Res call(
      {String owner,
      String creationTime,
      String type,
      String lastUpdated,
      String name,
      String id,
      C8y_Position c8y_Position});

  $C8y_PositionCopyWith<$Res> get c8y_Position;
}

/// @nodoc
class _$DeviceInfoCopyWithImpl<$Res, $Val extends DeviceInfo>
    implements $DeviceInfoCopyWith<$Res> {
  _$DeviceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
    Object? creationTime = null,
    Object? type = null,
    Object? lastUpdated = null,
    Object? name = null,
    Object? id = null,
    Object? c8y_Position = null,
  }) {
    return _then(_value.copyWith(
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      creationTime: null == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      c8y_Position: null == c8y_Position
          ? _value.c8y_Position
          : c8y_Position // ignore: cast_nullable_to_non_nullable
              as C8y_Position,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $C8y_PositionCopyWith<$Res> get c8y_Position {
    return $C8y_PositionCopyWith<$Res>(_value.c8y_Position, (value) {
      return _then(_value.copyWith(c8y_Position: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DeviceInfoCopyWith<$Res>
    implements $DeviceInfoCopyWith<$Res> {
  factory _$$_DeviceInfoCopyWith(
          _$_DeviceInfo value, $Res Function(_$_DeviceInfo) then) =
      __$$_DeviceInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String owner,
      String creationTime,
      String type,
      String lastUpdated,
      String name,
      String id,
      C8y_Position c8y_Position});

  @override
  $C8y_PositionCopyWith<$Res> get c8y_Position;
}

/// @nodoc
class __$$_DeviceInfoCopyWithImpl<$Res>
    extends _$DeviceInfoCopyWithImpl<$Res, _$_DeviceInfo>
    implements _$$_DeviceInfoCopyWith<$Res> {
  __$$_DeviceInfoCopyWithImpl(
      _$_DeviceInfo _value, $Res Function(_$_DeviceInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? owner = null,
    Object? creationTime = null,
    Object? type = null,
    Object? lastUpdated = null,
    Object? name = null,
    Object? id = null,
    Object? c8y_Position = null,
  }) {
    return _then(_$_DeviceInfo(
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      creationTime: null == creationTime
          ? _value.creationTime
          : creationTime // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      c8y_Position: null == c8y_Position
          ? _value.c8y_Position
          : c8y_Position // ignore: cast_nullable_to_non_nullable
              as C8y_Position,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeviceInfo implements _DeviceInfo {
  _$_DeviceInfo(
      {required this.owner,
      required this.creationTime,
      required this.type,
      required this.lastUpdated,
      required this.name,
      required this.id,
      required this.c8y_Position});

  factory _$_DeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$$_DeviceInfoFromJson(json);

  @override
  final String owner;
  @override
  final String creationTime;
  @override
  final String type;
  @override
  final String lastUpdated;
  @override
  final String name;
  @override
  final String id;
  @override
  final C8y_Position c8y_Position;

  @override
  String toString() {
    return 'DeviceInfo(owner: $owner, creationTime: $creationTime, type: $type, lastUpdated: $lastUpdated, name: $name, id: $id, c8y_Position: $c8y_Position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceInfo &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.creationTime, creationTime) ||
                other.creationTime == creationTime) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.c8y_Position, c8y_Position) ||
                other.c8y_Position == c8y_Position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, owner, creationTime, type,
      lastUpdated, name, id, c8y_Position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceInfoCopyWith<_$_DeviceInfo> get copyWith =>
      __$$_DeviceInfoCopyWithImpl<_$_DeviceInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeviceInfoToJson(
      this,
    );
  }
}

abstract class _DeviceInfo implements DeviceInfo {
  factory _DeviceInfo(
      {required final String owner,
      required final String creationTime,
      required final String type,
      required final String lastUpdated,
      required final String name,
      required final String id,
      required final C8y_Position c8y_Position}) = _$_DeviceInfo;

  factory _DeviceInfo.fromJson(Map<String, dynamic> json) =
      _$_DeviceInfo.fromJson;

  @override
  String get owner;
  @override
  String get creationTime;
  @override
  String get type;
  @override
  String get lastUpdated;
  @override
  String get name;
  @override
  String get id;
  @override
  C8y_Position get c8y_Position;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceInfoCopyWith<_$_DeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
