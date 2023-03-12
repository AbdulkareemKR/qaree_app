import 'package:Qaree/models/start_end_date/start_end_date.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class Session with _$Session {
  factory Session({
    required String id,
    String? userId,
    String? bookId,
    @JsonKey(name: 'startDate', fromJson: _dateFromJson) DateTime? startDate,
    @JsonKey(name: 'endDate', fromJson: _dateFromJson) DateTime? endDate,
    int? numberOfPages,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}

DateTime _dateFromJson(Timestamp timestamp) =>
    DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
