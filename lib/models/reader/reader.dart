import 'package:Qaree/enums/education_level.dart';
import 'package:Qaree/models/book_shelf/book_shelf.dart';
import 'package:Qaree/models/group/group.dart';
import 'package:Qaree/models/note/note.dart';
import 'package:Qaree/models/session/session.dart';
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
    List<Group>? groups,
    List<String>? friendList,
    List<Note>? notes,
    BookShelf? bookShelf,
    List<Session>? sessions,
    String? imageUrl,
  }) = _Reader;

  factory Reader.fromJson(Map<String, dynamic> json) => _$ReaderFromJson(json);
}
