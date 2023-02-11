// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alarms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Alarms _$$_AlarmsFromJson(Map<String, dynamic> json) => _$_Alarms(
      severity: json['severity'] as String,
      creationTime: json['creationTime'] as String,
      count: json['count'] as int,
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
      type: json['type'] as String,
      lastUpdated: json['lastUpdated'] as String,
      time: json['time'] as String,
      id: json['id'] as String,
      status: json['status'] as String,
      text: json['text'] as String,
    );

Map<String, dynamic> _$$_AlarmsToJson(_$_Alarms instance) => <String, dynamic>{
      'severity': instance.severity,
      'creationTime': instance.creationTime,
      'count': instance.count,
      'source': instance.source,
      'type': instance.type,
      'lastUpdated': instance.lastUpdated,
      'time': instance.time,
      'id': instance.id,
      'status': instance.status,
      'text': instance.text,
    };
