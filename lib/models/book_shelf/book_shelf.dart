import 'package:Qaree/models/book/book.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'book_shelf.freezed.dart';
part 'book_shelf.g.dart';

@freezed
class BookShelf with _$BookShelf {
  factory BookShelf({
    required String id,
    String? userId,
    List<String>? books,
  }) = _BookShelf;

  factory BookShelf.fromJson(Map<String, dynamic> json) =>
      _$BookShelfFromJson(json);
}
