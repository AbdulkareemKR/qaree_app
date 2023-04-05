// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Session _$$_SessionFromJson(Map<String, dynamic> json) => _$_Session(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      bookId: json['bookId'] as String?,
      startDate: _dateFromJson(json['startDate'] as Timestamp),
      endDate: _dateFromJson(json['endDate'] as Timestamp),
      numberOfPages: json['numberOfPages'] as int?,
      totalReadingTime: json['totalReadingTime'] as int? ?? 0,
      isFinished: json['isFinished'] as bool? ?? false,
      pausesStartEndTime: json['pausesStartEndTime'] == null
          ? null
          : StartEndDate.fromJson(
              json['pausesStartEndTime'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SessionToJson(_$_Session instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'bookId': instance.bookId,
      'startDate': _dateToJson(instance.startDate),
      'endDate': _dateToJson(instance.endDate),
      'numberOfPages': instance.numberOfPages,
      'totalReadingTime': instance.totalReadingTime,
      'isFinished': instance.isFinished,
      'pausesStartEndTime': instance.pausesStartEndTime,
    };
