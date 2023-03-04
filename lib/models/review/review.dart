import 'package:freezed_annotation/freezed_annotation.dart';
part 'review.freezed.dart';
part 'review.g.dart';

@freezed
class Review with _$Review {
  factory Review({
    required String id,
    String? userId,
    String? bookId,
    String? reviewContent,
    double? rating,
    DateTime? date,
    @Default(false) bool? isPublic,
  }) = _Review;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
