import 'package:Naqaa/features/home/presentation/models/source/source.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'c8y_Position.freezed.dart';
part 'c8y_Position.g.dart';

@freezed
class C8y_Position with _$C8y_Position {
  factory C8y_Position({
    required double lng,
    required double lat,
  }) = _C8y_Position;

  factory C8y_Position.fromJson(Map<String, dynamic> json) =>
      _$C8y_PositionFromJson(json);
}
