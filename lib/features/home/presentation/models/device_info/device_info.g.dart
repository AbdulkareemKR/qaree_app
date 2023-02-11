// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DeviceInfo _$$_DeviceInfoFromJson(Map<String, dynamic> json) =>
    _$_DeviceInfo(
      owner: json['owner'] as String,
      creationTime: json['creationTime'] as String,
      type: json['type'] as String,
      lastUpdated: json['lastUpdated'] as String,
      name: json['name'] as String,
      id: json['id'] as String,
      c8y_Position:
          C8y_Position.fromJson(json['c8y_Position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DeviceInfoToJson(_$_DeviceInfo instance) =>
    <String, dynamic>{
      'owner': instance.owner,
      'creationTime': instance.creationTime,
      'type': instance.type,
      'lastUpdated': instance.lastUpdated,
      'name': instance.name,
      'id': instance.id,
      'c8y_Position': instance.c8y_Position,
    };
