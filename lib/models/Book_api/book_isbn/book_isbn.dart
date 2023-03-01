import 'package:Qaree/enums/book_genre.dart';
import 'package:Qaree/models/review/review.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'book_isbn.freezed.dart';
part 'book_isbn.g.dart';

@freezed
class BookIsbn with _$BookIsbn {
  factory BookIsbn({
    String? type,
    String? identifier,
  }) = _BookIsbn;

  factory BookIsbn.fromJson(Map<String, dynamic> json) =>
      _$BookIsbnFromJson(json);
}
