import 'package:freezed_annotation/freezed_annotation.dart';
part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class Note with _$Note {
  factory Note({
    required String id,
    required String userId,
    required String bookId,
    required String noteContent,
    required DateTime date,
    @Default(false) bool isPublic,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}
