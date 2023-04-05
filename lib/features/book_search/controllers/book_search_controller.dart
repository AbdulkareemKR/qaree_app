import 'package:Qaree/features/book_search/providers/book_search_provider.dart';
import 'package:Qaree/features/book_search/screens/book_preview_screen.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/services/easy_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookSearchController {
  BuildContext context;
  WidgetRef ref;

  BookSearchController({required this.context, required this.ref});

  TextEditingController bookSearch = TextEditingController();

  void onSearchSubmit(String? bookName) {
    ref.read(BookSearchProvider.bookSearchQueryProvider.notifier).state =
        bookName ?? "";
  }

  void onBookTap(Book book) {
    EasyNavigator.openPage(
        context: context, page: BookPreviewScreen(book: book));
  }
}
