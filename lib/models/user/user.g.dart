// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String,
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
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      price: json['price'] as String,
      size: json['size'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'educationLevel': _$EducationLevelEnumMap[instance.educationLevel]!,
      'groups': instance.groups,
      'friendList': instance.friendList,
      'notes': instance.notes,
      'bookShelf': instance.bookShelf,
      'sessions': instance.sessions,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'price': instance.price,
      'size': instance.size,
      'image': instance.image,
    };

const _$EducationLevelEnumMap = {
  EducationLevel.none: 'none',
  EducationLevel.primary: 'primary',
  EducationLevel.secondary: 'secondary',
  EducationLevel.highSchool: 'highSchool',
  EducationLevel.undergraduate: 'undergraduate',
  EducationLevel.graduate: 'graduate',
  EducationLevel.postGraduate: 'postGraduate',
  EducationLevel.doctorate: 'doctorate',
};
