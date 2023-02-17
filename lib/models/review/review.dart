import 'package:Qaree/models/user/education_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class Review with _$Review {
  factory Review({
    required String id,
    required String userId,
    required String bookId,
    required String reviewContent,
    required double rating,
    required DateTime date,
    @Default(false) bool isPublic,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
