// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_end_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StartEndDate _$$_StartEndDateFromJson(Map<String, dynamic> json) =>
    _$_StartEndDate(
      startDate: _dateFromJson(json['startDate'] as Timestamp),
      endDate: _dateFromJson(json['endDate'] as Timestamp),
    );

Map<String, dynamic> _$$_StartEndDateToJson(_$_StartEndDate instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
    };
