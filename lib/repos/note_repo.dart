import 'package:Qaree/models/note/note.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/repos/firestore_repo.dart';
import 'package:Qaree/utils/status_logger/extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteRepo {
  // Providers
  static final getNotesByBookIdAndUserIdProvider =
      StreamProvider.family<List<Note>, String?>((ref, bookId) {
    final userId = ref.watch(readerProvider).whenData((user) => user.id);
    return getNotesByBookIdAndUserId(bookId, userId.asData?.value);
  });

  // Functions
  static Future<Note?> addNoteToUser({required Note note}) async {
    try {
      await FirestoreRepo.notesCollection
          .doc(note.id)
          .set(note.toJson(), SetOptions(merge: true));
      return note;
    } catch (e) {
      e.logException();
      return null;
    }
  }

  static Stream<List<Note>> getNotesByBookIdAndUserId(
      String? bookId, String? userId) {
    try {
      final reviewsStream = FirestoreRepo.notesCollection
          .where('userId', isEqualTo: userId)
          .where('bookId', isEqualTo: bookId)
          .snapshots()
          .map((list) {
        final reviewsList =
            list.docs.map((doc) => Note.fromJson(doc.data())).toList();
        return reviewsList;
      });
      return reviewsStream;
    } catch (e) {
      e.logException();
      return const Stream.empty();
    }
  }
}
