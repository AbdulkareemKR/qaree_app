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
  String? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get bookId => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'startDate',
      fromJson: _dateFromJson,
      toJson: _dateToJson,
      nullable: true)
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'endDate',
      fromJson: _dateFromJson,
      toJson: _dateToJson,
      nullable: true)
  DateTime? get endDate => throw _privateConstructorUsedError;
  int? get numberOfPages => throw _privateConstructorUsedError;
  int? get totalReadingTime => throw _privateConstructorUsedError;
  bool? get isFinished => throw _privateConstructorUsedError;
  StartEndDate? get pausesStartEndTime => throw _privateConstructorUsedError;

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
      {String? id,
      String? userId,
      String? bookId,
      @JsonKey(name: 'startDate', fromJson: _dateFromJson, toJson: _dateToJson, nullable: true)
          DateTime? startDate,
      @JsonKey(name: 'endDate', fromJson: _dateFromJson, toJson: _dateToJson, nullable: true)
          DateTime? endDate,
      int? numberOfPages,
      int? totalReadingTime,
      bool? isFinished,
      StartEndDate? pausesStartEndTime});

  $StartEndDateCopyWith<$Res>? get pausesStartEndTime;
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
    Object? id = freezed,
    Object? userId = freezed,
    Object? bookId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? numberOfPages = freezed,
    Object? totalReadingTime = freezed,
    Object? isFinished = freezed,
    Object? pausesStartEndTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      numberOfPages: freezed == numberOfPages
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalReadingTime: freezed == totalReadingTime
          ? _value.totalReadingTime
          : totalReadingTime // ignore: cast_nullable_to_non_nullable
              as int?,
      isFinished: freezed == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool?,
      pausesStartEndTime: freezed == pausesStartEndTime
          ? _value.pausesStartEndTime
          : pausesStartEndTime // ignore: cast_nullable_to_non_nullable
              as StartEndDate?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StartEndDateCopyWith<$Res>? get pausesStartEndTime {
    if (_value.pausesStartEndTime == null) {
      return null;
    }

    return $StartEndDateCopyWith<$Res>(_value.pausesStartEndTime!, (value) {
      return _then(_value.copyWith(pausesStartEndTime: value) as $Val);
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
      {String? id,
      String? userId,
      String? bookId,
      @JsonKey(name: 'startDate', fromJson: _dateFromJson, toJson: _dateToJson, nullable: true)
          DateTime? startDate,
      @JsonKey(name: 'endDate', fromJson: _dateFromJson, toJson: _dateToJson, nullable: true)
          DateTime? endDate,
      int? numberOfPages,
      int? totalReadingTime,
      bool? isFinished,
      StartEndDate? pausesStartEndTime});

  @override
  $StartEndDateCopyWith<$Res>? get pausesStartEndTime;
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
    Object? id = freezed,
    Object? userId = freezed,
    Object? bookId = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? numberOfPages = freezed,
    Object? totalReadingTime = freezed,
    Object? isFinished = freezed,
    Object? pausesStartEndTime = freezed,
  }) {
    return _then(_$_Session(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      bookId: freezed == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      numberOfPages: freezed == numberOfPages
          ? _value.numberOfPages
          : numberOfPages // ignore: cast_nullable_to_non_nullable
              as int?,
      totalReadingTime: freezed == totalReadingTime
          ? _value.totalReadingTime
          : totalReadingTime // ignore: cast_nullable_to_non_nullable
              as int?,
      isFinished: freezed == isFinished
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool?,
      pausesStartEndTime: freezed == pausesStartEndTime
          ? _value.pausesStartEndTime
          : pausesStartEndTime // ignore: cast_nullable_to_non_nullable
              as StartEndDate?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Session implements _Session {
  _$_Session(
      {this.id,
      this.userId,
      this.bookId,
      @JsonKey(name: 'startDate', fromJson: _dateFromJson, toJson: _dateToJson, nullable: true)
          this.startDate,
      @JsonKey(name: 'endDate', fromJson: _dateFromJson, toJson: _dateToJson, nullable: true)
          this.endDate,
      this.numberOfPages,
      this.totalReadingTime = 0,
      this.isFinished = false,
      this.pausesStartEndTime});

  factory _$_Session.fromJson(Map<String, dynamic> json) =>
      _$$_SessionFromJson(json);

  @override
  final String? id;
  @override
  final String? userId;
  @override
  final String? bookId;
  @override
  @JsonKey(
      name: 'startDate',
      fromJson: _dateFromJson,
      toJson: _dateToJson,
      nullable: true)
  final DateTime? startDate;
  @override
  @JsonKey(
      name: 'endDate',
      fromJson: _dateFromJson,
      toJson: _dateToJson,
      nullable: true)
  final DateTime? endDate;
  @override
  final int? numberOfPages;
  @override
  @JsonKey()
  final int? totalReadingTime;
  @override
  @JsonKey()
  final bool? isFinished;
  @override
  final StartEndDate? pausesStartEndTime;

  @override
  String toString() {
    return 'Session(id: $id, userId: $userId, bookId: $bookId, startDate: $startDate, endDate: $endDate, numberOfPages: $numberOfPages, totalReadingTime: $totalReadingTime, isFinished: $isFinished, pausesStartEndTime: $pausesStartEndTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Session &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.numberOfPages, numberOfPages) ||
                other.numberOfPages == numberOfPages) &&
            (identical(other.totalReadingTime, totalReadingTime) ||
                other.totalReadingTime == totalReadingTime) &&
            (identical(other.isFinished, isFinished) ||
                other.isFinished == isFinished) &&
            (identical(other.pausesStartEndTime, pausesStartEndTime) ||
                other.pausesStartEndTime == pausesStartEndTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, bookId, startDate,
      endDate, numberOfPages, totalReadingTime, isFinished, pausesStartEndTime);

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
      {final String? id,
      final String? userId,
      final String? bookId,
      @JsonKey(name: 'startDate', fromJson: _dateFromJson, toJson: _dateToJson, nullable: true)
          final DateTime? startDate,
      @JsonKey(name: 'endDate', fromJson: _dateFromJson, toJson: _dateToJson, nullable: true)
          final DateTime? endDate,
      final int? numberOfPages,
      final int? totalReadingTime,
      final bool? isFinished,
      final StartEndDate? pausesStartEndTime}) = _$_Session;

  factory _Session.fromJson(Map<String, dynamic> json) = _$_Session.fromJson;

  @override
  String? get id;
  @override
  String? get userId;
  @override
  String? get bookId;
  @override
  @JsonKey(
      name: 'startDate',
      fromJson: _dateFromJson,
      toJson: _dateToJson,
      nullable: true)
  DateTime? get startDate;
  @override
  @JsonKey(
      name: 'endDate',
      fromJson: _dateFromJson,
      toJson: _dateToJson,
      nullable: true)
  DateTime? get endDate;
  @override
  int? get numberOfPages;
  @override
  int? get totalReadingTime;
  @override
  bool? get isFinished;
  @override
  StartEndDate? get pausesStartEndTime;
  @override
  @JsonKey(ignore: true)
  _$$_SessionCopyWith<_$_Session> get copyWith =>
      throw _privateConstructorUsedError;
}
