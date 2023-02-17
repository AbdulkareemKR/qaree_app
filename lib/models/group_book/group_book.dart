import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/models/start_end_date/start_end_date.dart';
import 'package:Qaree/models/user/education_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'group_book.freezed.dart';
part 'group_book.g.dart';

@freezed
class GroupBook with _$GroupBook {
  factory GroupBook({
    required StartEndDate period,
    required Book book,
  }) = _GroupBook;

  factory GroupBook.fromJson(Map<String, dynamic> json) =>
      _$GroupBookFromJson(json);
}
