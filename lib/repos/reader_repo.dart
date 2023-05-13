import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/models/note/note.dart';
import 'package:Qaree/models/reader/reader.dart';
import 'package:Qaree/repos/firestore_repo.dart';
import 'package:Qaree/utils/status_logger/extensions.dart';
import 'package:Qaree/utils/status_logger/status_logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReaderRepo {
  // Providers
  static final getUserByIdProvider =
      FutureProvider.family<Reader?, String>((ref, uid) async {
    return getUserById(uid);
  });

  // Functions

  static Future<Reader?> getUserById(String uid) async {
    final user =
        await FirestoreRepo.readersCollection.where('id', isEqualTo: uid).get();
    if (user.docs.isNotEmpty) {
      final reader = Reader.fromJson(user.docs.first.data());
      return reader;
    } else {
      return null;
    }
  }

  static Future<Reader?> createReader(
      {required String id, required String name, required String email}) async {
    final Reader reader = Reader(id: id, name: name, email: email);
    try {
      await FirestoreRepo.readersCollection
          .doc(id)
          .set(reader.toJson(), SetOptions(merge: true));
      return reader;
    } catch (e) {
      e.logException();
      return null;
    }
  }

  static Stream<Reader> getReaderStream(String? uid,
      {bool ignoreDefaultCar = false}) {
    if (uid == null) {
      return Stream.empty();
    }
    try {
      final user =
          FirestoreRepo.readersCollection.doc(uid).snapshots().map((doc) {
        try {
          final reader = Reader.fromJson(doc.data()!);
          return reader;
        } catch (e) {
          // Ensure that the user is logged out when any error is encountered

          StatusLogger.warning(
              "Logging out the current user with $uid because of an error in their data");
          FirebaseAuth.instance.signOut().ignore();

          e.logException();
          throw Exception(e);
        }
      });
      return user;
    } catch (e) {
      e.logException();
      throw Exception(e);
    }
  }

  static Future<Note?> addBookToUser(
      {required String? userId, required String? bookId}) async {
    await FirestoreRepo.readersCollection.doc(userId).update({
      "books": FieldValue.arrayUnion([bookId]),
    }).then((value) => StatusLogger.debug("book added successfully!"),
        onError: (e) => StatusLogger.error("Error adding book $e"));
    return null;
  }

  static Future<String?> removeBookFromUser(
      {required String userId, required String? bookId}) async {
    try {
      // Get the document reference for the user using the provided user ID
      DocumentReference userDocRef =
          FirestoreRepo.readersCollection.doc(userId);

      // Remove the book ID from the 'books' array using FieldValue.arrayRemove
      await userDocRef.update({
        'books': FieldValue.arrayRemove([bookId])
      });

      return bookId;
    } catch (e) {
      e.logException();
      return null;
    }
  }

  static Future<Note?> addGroupToUser(
      {required String? userId, required String? groupId}) async {
    await FirestoreRepo.readersCollection.doc(userId).update({
      "groups": FieldValue.arrayUnion([groupId]),
    }).then((value) => StatusLogger.debug("group added successfully!"),
        onError: (e) => StatusLogger.error("Error adding group $e"));
    return null;
  }
}
