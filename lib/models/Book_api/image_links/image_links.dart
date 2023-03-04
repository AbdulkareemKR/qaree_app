import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_links.freezed.dart';
part 'image_links.g.dart';

@freezed
class ImageLinks with _$ImageLinks {
  factory ImageLinks({
    String? smallThumbnail,
    String? thumbnail,
  }) = _ImageLinks;

  factory ImageLinks.fromJson(Map<String, dynamic> json) =>
      _$ImageLinksFromJson(json);
}
