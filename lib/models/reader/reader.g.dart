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
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      friendList: (json['friendList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      notes: (json['notes'] as List<dynamic>?)
          ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
      bookShelf: json['bookShelf'] == null
          ? null
          : BookShelf.fromJson(json['bookShelf'] as Map<String, dynamic>),
      sessions: (json['sessions'] as List<dynamic>?)
          ?.map((e) => Session.fromJson(e as Map<String, dynamic>))
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
      'bookShelf': instance.bookShelf,
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
