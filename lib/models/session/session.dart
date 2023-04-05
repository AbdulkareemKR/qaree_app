import 'package:Qaree/models/start_end_date/start_end_date.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session {
  factory Session({
    String? id,
    String? userId,
    String? bookId,
    @JsonKey(name: 'startDate', fromJson: _dateFromJson, toJson: _dateToJson, nullable: true)
        DateTime? startDate,
    @JsonKey(name: 'endDate', fromJson: _dateFromJson, toJson: _dateToJson, nullable: true)
        DateTime? endDate,
    int? numberOfPages,
    @Default(0) int? totalReadingTime,
    @Default(false) bool? isFinished,
    StartEndDate? pausesStartEndTime,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

DateTime _dateFromJson(Timestamp timestamp) =>
    DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);

Timestamp _dateToJson(DateTime? dateTime) => Timestamp.fromDate(dateTime!);
