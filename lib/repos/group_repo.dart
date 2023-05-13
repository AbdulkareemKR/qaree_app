import 'package:Qaree/models/group/group.dart';
import 'package:Qaree/repos/firestore_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Qaree/utils/status_logger/extensions.dart';

class GroupRepo {
  // Providers
  static final getGroupByIdProvider =
      StreamProvider.family<Group?, String>((ref, groupId) {
    return getGroupById(groupId);
  });

  static Stream<Group?> getGroupById(String id) {
    try {
      final reviewsStream = FirestoreRepo.groupsCollection
          .where('id', isEqualTo: id)
          .snapshots()
          .map((list) {
        final reviewsList =
            list.docs.map((doc) => Group.fromJson(doc.data())).toList();

        if (reviewsList.isNotEmpty) {
          return reviewsList.first;
        }
      });
      return reviewsStream;
    } catch (e) {
      e.logException();
      return const Stream.empty();
    }
  }

  static Future<Group?> createGroup({required Group group}) async {
    try {
      await FirestoreRepo.groupsCollection
          .doc(group.id)
          .set(group.toJson(), SetOptions(merge: true));
      return group;
    } catch (e) {
      e.logException();
      return null;
    }
  }
}
