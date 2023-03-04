// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Session _$$_SessionFromJson(Map<String, dynamic> json) => _$_Session(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      bookId: json['bookId'] as String?,
      startEndDate: json['startEndDate'] == null
          ? null
          : StartEndDate.fromJson(json['startEndDate'] as Map<String, dynamic>),
      numberOfPages: json['numberOfPages'] as int?,
    );

Map<String, dynamic> _$$_SessionToJson(_$_Session instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'bookId': instance.bookId,
      'startEndDate': instance.startEndDate,
      'numberOfPages': instance.numberOfPages,
    };
