import 'package:Qaree/enums/book_genre.dart';
import 'package:Qaree/models/Book_api/volume_info/volume_info.dart';
import 'package:Qaree/models/review/review.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'book_api.freezed.dart';
part 'book_api.g.dart';

@freezed
class BookApi with _$BookApi {
  factory BookApi({
    required String id,
    String? kind,
    VolumeInfo? volumeInfo,
  }) = _BookApi;

  factory BookApi.fromJson(Map<String, dynamic> json) =>
      _$BookApiFromJson(json);
}
