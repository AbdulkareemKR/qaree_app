import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/repos/firestore_repo.dart';
import 'package:Qaree/utils/status_logger/extensions.dart';
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
      await FirestoreRepo.booksCollection
          .doc(book.id)
          .set(book.toJson(), SetOptions(merge: true));
      return book;
    } catch (e) {
      e.logException();
      return null;
    }
  }
}
