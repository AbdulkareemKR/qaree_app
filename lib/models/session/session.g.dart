// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Session _$$_SessionFromJson(Map<String, dynamic> json) => _$_Session(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      bookId: json['bookId'] as String?,
      startDate: _dateFromJson(json['startDate'] as Timestamp),
      endDate: _dateFromJson(json['endDate'] as Timestamp),
      numberOfPages: json['numberOfPages'] as int?,
    );

Map<String, dynamic> _$$_SessionToJson(_$_Session instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'bookId': instance.bookId,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'numberOfPages': instance.numberOfPages,
    };
