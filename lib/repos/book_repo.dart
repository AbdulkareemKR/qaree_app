import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/models/group_book/group_book.dart';
import 'package:Qaree/repos/firestore_repo.dart';
import 'package:Qaree/utils/status_logger/extensions.dart';
import 'package:Qaree/utils/status_logger/status_logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookRepo {
  // Providers
  static final getBookByIdProvider =
      FutureProvider.family<Book?, String>((ref, bookId) async {
    return getBookById(bookId);
  });

  // Functions
  static Future<Book?> getBookById(String id) async {
    final bookDocs =
        await FirestoreRepo.booksCollection.where('id', isEqualTo: id).get();
    if (bookDocs.docs.isNotEmpty) {
      final book = Book.fromJson(bookDocs.docs.first.data());
      return book;
    } else {
      return null;
    }
  }

  static Future<Book?> addBook({required Book book}) async {
    try {
      final bookDoc = FirestoreRepo.booksCollection.doc(book.id);
      final bookSnapshot = await bookDoc.get();

      if (!bookSnapshot.exists) {
        await bookDoc.set(book.toJson());
        return book;
      } else {
        return null;
      }
    } catch (e) {
      e.logException();
      return null;
    }
  }

  static Future<Book?> addBookToGroup(
      {required GroupBook groupBook, required String groupId}) async {
    await FirestoreRepo.groupsCollection.doc(groupId).update({
      "groupBooks": FieldValue.arrayUnion([groupBook.toJson()]),
    }).then((value) => StatusLogger.debug("group added successfully!"),
        onError: (e) => StatusLogger.error("Error adding group $e"));
    return null;
  }
}
