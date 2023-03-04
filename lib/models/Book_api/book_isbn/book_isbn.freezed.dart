// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_isbn.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookIsbn _$BookIsbnFromJson(Map<String, dynamic> json) {
  return _BookIsbn.fromJson(json);
}

/// @nodoc
mixin _$BookIsbn {
  String? get type => throw _privateConstructorUsedError;
  String? get identifier => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookIsbnCopyWith<BookIsbn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookIsbnCopyWith<$Res> {
  factory $BookIsbnCopyWith(BookIsbn value, $Res Function(BookIsbn) then) =
      _$BookIsbnCopyWithImpl<$Res, BookIsbn>;
  @useResult
  $Res call({String? type, String? identifier});
}

/// @nodoc
class _$BookIsbnCopyWithImpl<$Res, $Val extends BookIsbn>
    implements $BookIsbnCopyWith<$Res> {
  _$BookIsbnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookIsbnCopyWith<$Res> implements $BookIsbnCopyWith<$Res> {
  factory _$$_BookIsbnCopyWith(
          _$_BookIsbn value, $Res Function(_$_BookIsbn) then) =
      __$$_BookIsbnCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? type, String? identifier});
}

/// @nodoc
class __$$_BookIsbnCopyWithImpl<$Res>
    extends _$BookIsbnCopyWithImpl<$Res, _$_BookIsbn>
    implements _$$_BookIsbnCopyWith<$Res> {
  __$$_BookIsbnCopyWithImpl(
      _$_BookIsbn _value, $Res Function(_$_BookIsbn) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? identifier = freezed,
  }) {
    return _then(_$_BookIsbn(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      identifier: freezed == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookIsbn implements _BookIsbn {
  _$_BookIsbn({this.type, this.identifier});

  factory _$_BookIsbn.fromJson(Map<String, dynamic> json) =>
      _$$_BookIsbnFromJson(json);

  @override
  final String? type;
  @override
  final String? identifier;

  @override
  String toString() {
    return 'BookIsbn(type: $type, identifier: $identifier)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookIsbn &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type, identifier);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookIsbnCopyWith<_$_BookIsbn> get copyWith =>
      __$$_BookIsbnCopyWithImpl<_$_BookIsbn>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookIsbnToJson(
      this,
    );
  }
}

abstract class _BookIsbn implements BookIsbn {
  factory _BookIsbn({final String? type, final String? identifier}) =
      _$_BookIsbn;

  factory _BookIsbn.fromJson(Map<String, dynamic> json) = _$_BookIsbn.fromJson;

  @override
  String? get type;
  @override
  String? get identifier;
  @override
  @JsonKey(ignore: true)
  _$$_BookIsbnCopyWith<_$_BookIsbn> get copyWith =>
      throw _privateConstructorUsedError;
}
