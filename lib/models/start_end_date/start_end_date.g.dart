// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_end_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StartEndDate _$$_StartEndDateFromJson(Map<String, dynamic> json) =>
    _$_StartEndDate(
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$$_StartEndDateToJson(_$_StartEndDate instance) =>
    <String, dynamic>{
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
    };
