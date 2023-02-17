import 'package:Qaree/models/book_shelf/book_shelf.dart';
import 'package:Qaree/models/group/group.dart';
import 'package:Qaree/models/note/note.dart';
import 'package:Qaree/models/session/session.dart';
import 'package:Qaree/models/user/education_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  factory User({
    required String id,
    @Default(EducationLevel.none) EducationLevel educationLevel,
    List<Group>? groups,
    List<String>? friendList,
    List<Note>? notes,
    BookShelf? bookShelf,
    List<Session>? sessions,
    double? latitude,
    double? longitude,
    required String price,
    required String size,
    String? image,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
