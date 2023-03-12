// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroupBook _$$_GroupBookFromJson(Map<String, dynamic> json) => _$_GroupBook(
      period: StartEndDate.fromJson(json['period'] as Map<String, dynamic>),
      bookId: json['bookId'] as String,
    );

Map<String, dynamic> _$$_GroupBookToJson(_$_GroupBook instance) =>
    <String, dynamic>{
      'period': instance.period,
      'bookId': instance.bookId,
    };
