import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/models/user/education_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'book_shelf.freezed.dart';
part 'book_shelf.g.dart';

@freezed
class BookShelf with _$BookShelf {
  factory BookShelf({
    required String id,
    required String userId,
    List<Book>? books,
    @Default(false) bool isPublic,
  }) = _BookShelf;

  factory BookShelf.fromJson(Map<String, dynamic> json) =>
      _$BookShelfFromJson(json);
}
