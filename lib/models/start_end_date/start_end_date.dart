import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'start_end_date.freezed.dart';
part 'start_end_date.g.dart';

@freezed
class StartEndDate with _$StartEndDate {
  factory StartEndDate({
    @JsonKey(name: 'startDate', fromJson: _dateFromJson, toJson: _dateToJson, nullable: true)
        DateTime? startDate,
    @JsonKey(name: 'endDate', fromJson: _dateFromJson, toJson: _dateToJson, nullable: true)
        DateTime? endDate,
  }) = _StartEndDate;

  factory StartEndDate.fromJson(Map<String, dynamic> json) =>
      _$StartEndDateFromJson(json);
}

DateTime _dateFromJson(Timestamp timestamp) =>
    DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);

Timestamp _dateToJson(DateTime? dateTime) => Timestamp.fromDate(dateTime!);
