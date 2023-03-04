// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Group _$$_GroupFromJson(Map<String, dynamic> json) => _$_Group(
      GroupAdmins: (json['GroupAdmins'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
      name: json['name'] as String?,
      description: json['description'] as String?,
      members:
          (json['members'] as List<dynamic>?)?.map((e) => e as String).toList(),
      groupBooks: (json['groupBooks'] as List<dynamic>?)
          ?.map((e) => GroupBook.fromJson(e as Map<String, dynamic>))
          .toList(),
      groupLink: json['groupLink'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_GroupToJson(_$_Group instance) => <String, dynamic>{
      'GroupAdmins': instance.GroupAdmins,
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'members': instance.members,
      'groupBooks': instance.groupBooks,
      'groupLink': instance.groupLink,
      'image': instance.image,
    };
