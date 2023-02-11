import 'package:Naqaa/features/home/presentation/models/position/c8y_Position.dart';
import 'package:Naqaa/features/home/presentation/models/source/source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_info.freezed.dart';
part 'device_info.g.dart';

@freezed
class DeviceInfo with _$DeviceInfo {
  factory DeviceInfo({
    required String owner,
    required String creationTime,
    required String type,
    required String lastUpdated,
    required String name,
    required String id,
    required C8y_Position c8y_Position,
  }) = _DeviceInfo;

  factory DeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoFromJson(json);
}
