import 'package:Qaree/repos/firestore_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Qaree/models/book/book.dart';

class BookSearchController {
  BuildContext context;
  WidgetRef ref;

  BookSearchController({required this.context, required this.ref});

  TextEditingController bookSearch = TextEditingController();

  // Providers
  // static final getBooks =
  //     FutureProvider.family<dynamic?, String>((ref, query) async {
  //   return fetchBooks(query: query);
  // });

  Future fetchBooks({String? query}) async {
    try {
      print(query);
      final booksDocs = await FirestoreRepo.booksCollection
          .where("name", isGreaterThan: query)
          .where('name', isLessThanOrEqualTo: (query! + "\uf8ff"))
          .get();

      if (booksDocs.docs.isNotEmpty) {
        final books = booksDocs.docs.map((book) => book.data()).toList();
        print(books[0]);
        return books;
      } else {
        print("empty list");
        return [];
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
