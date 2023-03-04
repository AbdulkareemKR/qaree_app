import 'package:Qaree/enums/book_genre.dart';
import 'package:Qaree/models/Book_api/book_isbn/book_isbn.dart';
import 'package:Qaree/models/review/review.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'industry_identifiers.freezed.dart';
part 'industry_identifiers.g.dart';

@freezed
class IndustryIdentifiers with _$IndustryIdentifiers {
  factory IndustryIdentifiers({
    required List<BookIsbn> bookIsbn,
  }) = _IndustryIdentifiers;

  factory IndustryIdentifiers.fromJson(Map<String, dynamic> json) =>
      _$IndustryIdentifiersFromJson(json);
}
