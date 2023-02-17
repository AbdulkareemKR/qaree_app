// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
mixin _$Session {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get bookId => throw _privateConstructorUsedError;
  StartEndDate get startEndDate => throw _privateConstructorUsedError;
  int get numberOfPages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String bookId,
      StartEndDate startEndDate,
      int numberOfPages});

  $StartEndDateCopyWith<$Res> get startEndDate;
}

/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? bookId = null,
    Object? startEndDate = null,
    Object? numberOfPages = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
      startEndDate: null == startEndDate
          ? _value.startEndDate
          : startEndDate // ignore: cast_nullable_to_non_nullable
              as StartEndDate,
      numberOfPages: null == numberOfPages
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StartEndDateCopyWith<$Res> get startEndDate {
    return $StartEndDateCopyWith<$Res>(_value.startEndDate, (value) {
      return _then(_value.copyWith(startEndDate: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$_SessionCopyWith(
          _$_Session value, $Res Function(_$_Session) then) =
      __$$_SessionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String bookId,
      StartEndDate startEndDate,
      int numberOfPages});

  @override
  $StartEndDateCopyWith<$Res> get startEndDate;
}

/// @nodoc
class __$$_SessionCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$_Session>
    implements _$$_SessionCopyWith<$Res> {
  __$$_SessionCopyWithImpl(_$_Session _value, $Res Function(_$_Session) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? bookId = null,
    Object? startEndDate = null,
    Object? numberOfPages = null,
  }) {
    return _then(_$_Session(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String,
      startEndDate: null == startEndDate
          ? _value.startEndDate
          : startEndDate // ignore: cast_nullable_to_non_nullable
              as StartEndDate,
      numberOfPages: null == numberOfPages
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Session implements _Session {
  _$_Session(
      {required this.id,
      required this.userId,
      required this.bookId,
      required this.startEndDate,
      required this.numberOfPages});

  factory _$_Session.fromJson(Map<String, dynamic> json) =>
      _$$_SessionFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String bookId;
  @override
  final StartEndDate startEndDate;
  @override
  final int numberOfPages;

  @override
  String toString() {
    return 'Session(id: $id, userId: $userId, bookId: $bookId, startEndDate: $startEndDate, numberOfPages: $numberOfPages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Session &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.startEndDate, startEndDate) ||
                other.startEndDate == startEndDate) &&
            (identical(other.numberOfPages, numberOfPages) ||
                other.numberOfPages == numberOfPages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, bookId, startEndDate, numberOfPages);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SessionCopyWith<_$_Session> get copyWith =>
      __$$_SessionCopyWithImpl<_$_Session>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SessionToJson(
      this,
    );
  }
}

abstract class _Session implements Session {
  factory _Session(
      {required final String id,
      required final String userId,
      required final String bookId,
      required final StartEndDate startEndDate,
      required final int numberOfPages}) = _$_Session;

  factory _Session.fromJson(Map<String, dynamic> json) = _$_Session.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get bookId;
  @override
  StartEndDate get startEndDate;
  @override
  int get numberOfPages;
  @override
  @JsonKey(ignore: true)
  _$$_SessionCopyWith<_$_Session> get copyWith =>
      throw _privateConstructorUsedError;
}
