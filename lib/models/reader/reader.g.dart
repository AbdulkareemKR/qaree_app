// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reader.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reader _$$_ReaderFromJson(Map<String, dynamic> json) => _$_Reader(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      educationLevel: $enumDecodeNullable(
              _$EducationLevelEnumMap, json['educationLevel']) ??
          EducationLevel.none,
      groups:
          (json['groups'] as List<dynamic>?)?.map((e) => e as String).toList(),
      friendList: (json['friendList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      notes: (json['notes'] as List<dynamic>?)
          ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
      books:
          (json['books'] as List<dynamic>?)?.map((e) => e as String).toList(),
      sessions: (json['sessions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$_ReaderToJson(_$_Reader instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'educationLevel': _$EducationLevelEnumMap[instance.educationLevel]!,
      'groups': instance.groups,
      'friendList': instance.friendList,
      'notes': instance.notes,
      'books': instance.books,
      'sessions': instance.sessions,
      'imageUrl': instance.imageUrl,
    };

const _$EducationLevelEnumMap = {
  EducationLevel.none: 'none',
  EducationLevel.primary: 'primary',
  EducationLevel.secondary: 'secondary',
  EducationLevel.highSchool: 'highSchool',
  EducationLevel.bachelor: 'bachelor',
  EducationLevel.master: 'master',
  EducationLevel.doctorate: 'doctorate',
};
