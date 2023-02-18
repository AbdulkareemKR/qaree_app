import 'package:Qaree/enums/book_genre.dart';
import 'package:Qaree/models/review/review.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'book.freezed.dart';
part 'book.g.dart';

@freezed
class Book with _$Book {
  factory Book({
    required String id,
    required String name,
    double? rating,
    required DateTime publishDate,
    required List<String> author,
    int? pages,
    required String isbn,
    String? image,
    List<Review>? reviews,
    List<BookGenre>? genres,
  }) = _Book;

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
}
