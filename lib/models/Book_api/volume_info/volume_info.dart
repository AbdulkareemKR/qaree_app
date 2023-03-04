import 'package:Qaree/enums/book_genre.dart';
import 'package:Qaree/models/Book_api/book_isbn/book_isbn.dart';
import 'package:Qaree/models/Book_api/image_links/image_links.dart';
import 'package:Qaree/models/Book_api/industry_identifiers/industry_identifiers.dart';
import 'package:Qaree/models/review/review.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'volume_info.freezed.dart';
part 'volume_info.g.dart';

@freezed
class VolumeInfo with _$VolumeInfo {
  factory VolumeInfo({
    String? title,
    String? publishedDate,
    List<BookIsbn>? industryIdentifiers,
    String? printType,
    String? language,
    String? description,
    List<String>? authors,
    String? publisher,
    int? pageCount,
    List<String>? categories,
    double? averageRating,
    int? ratingsCount,
    ImageLinks? imageLinks,
  }) = _VolumeInfo;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) =>
      _$VolumeInfoFromJson(json);
}
