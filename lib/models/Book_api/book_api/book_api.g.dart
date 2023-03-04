// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookApi _$$_BookApiFromJson(Map<String, dynamic> json) => _$_BookApi(
      id: json['id'] as String,
      kind: json['kind'] as String?,
      volumeInfo: json['volumeInfo'] == null
          ? null
          : VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BookApiToJson(_$_BookApi instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'volumeInfo': instance.volumeInfo,
    };
