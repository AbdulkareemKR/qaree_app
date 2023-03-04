import 'package:Qaree/features/home/providers/home_screen_providers.dart';
import 'package:Qaree/features/home/screens/book_details_screen.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/models/note/note.dart';
import 'package:Qaree/services/easy_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreenController {
  BuildContext context;
  WidgetRef ref;

  HomeScreenController({
    required this.context,
    required this.ref,
  });

  void onBookTap(int bookIndex) {
    ref.read(selectedBookIndexProvider.notifier).state = bookIndex;
  }

  void onBookCardTap(Book book, List<Note>? notes) {
    EasyNavigator.openPage(
        context: context, page: BookDetailsScreen(book: book, notes: notes));
  }
}
