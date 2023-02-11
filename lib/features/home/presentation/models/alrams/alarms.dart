import 'package:Naqaa/features/home/presentation/models/source/source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarms.freezed.dart';
part 'alarms.g.dart';

@freezed
class Alarms with _$Alarms {
  factory Alarms({
    required String severity,
    required String creationTime,
    required int count,
    required Source source,
    required String type,
    required String lastUpdated,
    required String time,
    required String id,
    required String status,
    required String text,
  }) = _Alarms;

  factory Alarms.fromJson(Map<String, dynamic> json) => _$AlarmsFromJson(json);
}
