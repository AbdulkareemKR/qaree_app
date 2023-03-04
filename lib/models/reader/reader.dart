import 'package:Qaree/enums/education_level.dart';
import 'package:Qaree/models/note/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'reader.freezed.dart';
part 'reader.g.dart';

@freezed
class Reader with _$Reader {
  factory Reader({
    required String id,
    required String name,
    required String email,
    @Default(EducationLevel.none) EducationLevel educationLevel,
    List<String>? groups,
    List<String>? friendList,
    List<Note>? notes,
    List<String>? books,
    List<String>? sessions,
    String? imageUrl,
  }) = _Reader;

  factory Reader.fromJson(Map<String, dynamic> json) => _$ReaderFromJson(json);
}
