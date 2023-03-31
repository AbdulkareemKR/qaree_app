import 'package:Qaree/models/group_book/group_book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'group.freezed.dart';
part 'group.g.dart';

@freezed
class Group with _$Group {
  factory Group({
    List<Group>? GroupAdmins,
    required String id,
    String? name,
    String? description,
    List<String>? members,
    List<GroupBook>? groupBooks,
    String? groupLink,
    String? image,
    @JsonKey(name: 'createdAt', fromJson: _dateFromJson) DateTime? createdAt,
    List<String>? messages,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

DateTime _dateFromJson(Timestamp timestamp) =>
    DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
