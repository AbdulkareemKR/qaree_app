import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class Review with _$Review {
  factory Review({
    String? id,
    String? userId,
    String? bookId,
    String? reviewContent,
    num? rating,
    @JsonKey(name: 'date', fromJson: _dateFromJson, toJson: _dateToJson, nullable: true)
        DateTime? date,
    @Default(false) bool? isPublic,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}

DateTime _dateFromJson(Timestamp timestamp) =>
    DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);

Timestamp _dateToJson(DateTime? dateTime) => Timestamp.fromDate(dateTime!);
