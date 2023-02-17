import 'package:Qaree/models/group_book/group_book.dart';
import 'package:Qaree/models/user/education_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class Group with _$Group {
  factory Group({
    required List<Group> GroupAdmins,
    required String id,
    required String name,
    String? description,
    double? latitude,
    required List<String> members,
    required List<GroupBook>? groupBooks,
    String? groupLink,
    String? image,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}
