// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'start_end_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StartEndDate _$StartEndDateFromJson(Map<String, dynamic> json) {
  return _StartEndDate.fromJson(json);
}

/// @nodoc
mixin _$StartEndDate {
  @JsonKey(name: 'startDate', fromJson: _dateFromJson)
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'endDate', fromJson: _dateFromJson)
  DateTime? get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartEndDateCopyWith<StartEndDate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartEndDateCopyWith<$Res> {
  factory $StartEndDateCopyWith(
          StartEndDate value, $Res Function(StartEndDate) then) =
      _$StartEndDateCopyWithImpl<$Res, StartEndDate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'startDate', fromJson: _dateFromJson) DateTime? startDate,
      @JsonKey(name: 'endDate', fromJson: _dateFromJson) DateTime? endDate});
}

/// @nodoc
class _$StartEndDateCopyWithImpl<$Res, $Val extends StartEndDate>
    implements $StartEndDateCopyWith<$Res> {
  _$StartEndDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StartEndDateCopyWith<$Res>
    implements $StartEndDateCopyWith<$Res> {
  factory _$$_StartEndDateCopyWith(
          _$_StartEndDate value, $Res Function(_$_StartEndDate) then) =
      __$$_StartEndDateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'startDate', fromJson: _dateFromJson) DateTime? startDate,
      @JsonKey(name: 'endDate', fromJson: _dateFromJson) DateTime? endDate});
}

/// @nodoc
class __$$_StartEndDateCopyWithImpl<$Res>
    extends _$StartEndDateCopyWithImpl<$Res, _$_StartEndDate>
    implements _$$_StartEndDateCopyWith<$Res> {
  __$$_StartEndDateCopyWithImpl(
      _$_StartEndDate _value, $Res Function(_$_StartEndDate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$_StartEndDate(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartEndDate implements _StartEndDate {
  _$_StartEndDate(
      {@JsonKey(name: 'startDate', fromJson: _dateFromJson) this.startDate,
      @JsonKey(name: 'endDate', fromJson: _dateFromJson) this.endDate});

  factory _$_StartEndDate.fromJson(Map<String, dynamic> json) =>
      _$$_StartEndDateFromJson(json);

  @override
  @JsonKey(name: 'startDate', fromJson: _dateFromJson)
  final DateTime? startDate;
  @override
  @JsonKey(name: 'endDate', fromJson: _dateFromJson)
  final DateTime? endDate;

  @override
  String toString() {
    return 'StartEndDate(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartEndDate &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartEndDateCopyWith<_$_StartEndDate> get copyWith =>
      __$$_StartEndDateCopyWithImpl<_$_StartEndDate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartEndDateToJson(
      this,
    );
  }
}

abstract class _StartEndDate implements StartEndDate {
  factory _StartEndDate(
      {@JsonKey(name: 'startDate', fromJson: _dateFromJson)
          final DateTime? startDate,
      @JsonKey(name: 'endDate', fromJson: _dateFromJson)
          final DateTime? endDate}) = _$_StartEndDate;

  factory _StartEndDate.fromJson(Map<String, dynamic> json) =
      _$_StartEndDate.fromJson;

  @override
  @JsonKey(name: 'startDate', fromJson: _dateFromJson)
  DateTime? get startDate;
  @override
  @JsonKey(name: 'endDate', fromJson: _dateFromJson)
  DateTime? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$_StartEndDateCopyWith<_$_StartEndDate> get copyWith =>
      throw _privateConstructorUsedError;
}
