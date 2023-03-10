import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/models/group/group.dart';
import 'package:Qaree/repos/firestore_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroupRepo {
  // Providers
  static final getGroupByIdProvider =
      FutureProvider.family<Group?, String>((ref, groupId) async {
    return getGroupById(groupId);
  });

  // Functions
  static Future<Group?> getGroupById(String id) async {
    final groupsDocs =
        await FirestoreRepo.groupsCollection.where('id', isEqualTo: id).get();
    if (groupsDocs.docs.isNotEmpty) {
      final groups = Group.fromJson(groupsDocs.docs.first.data());
      return groups;
    } else {
      return null;
    }
  }
}
