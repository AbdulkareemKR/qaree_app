import 'package:Qaree/models/review/review.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  factory Book({
    String? id,
    String? name,
    String? description,
    double? rating,
    DateTime? publishDate,
    List<String>? authors,
    int? pages,
    String? publisher,
    List<String>? isbn,
    String? image,
    List<Review>? reviews,
    String? bookType,
    List<String>? genres,
    String? language,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
