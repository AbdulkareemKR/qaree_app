import 'package:freezed_annotation/freezed_annotation.dart';
part 'start_end_date.freezed.dart';
part 'start_end_date.g.dart';

@freezed
class StartEndDate with _$StartEndDate {
  factory StartEndDate({
    required DateTime startDate,
    DateTime? endDate,
  }) = _StartEndDate;

  factory StartEndDate.fromJson(Map<String, dynamic> json) =>
      _$StartEndDateFromJson(json);
}
