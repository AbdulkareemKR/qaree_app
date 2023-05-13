import 'package:Qaree/features/book_search/providers/book_search_provider.dart';
import 'package:Qaree/features/book_search/screens/book_preview_screen.dart';
import 'package:Qaree/features/groups/groups_providers/groups_provider.dart';
import 'package:Qaree/features/review/screens/add_review_screen.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/models/group_book/group_book.dart';
import 'package:Qaree/models/start_end_date/start_end_date.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/repos/book_repo.dart';
import 'package:Qaree/repos/group_repo.dart';
import 'package:Qaree/repos/reader_repo.dart';
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

  void onBookPressed(Book book) {
    EasyNavigator.openPage(
        context: context, page: BookPreviewScreen(book: book));
  }

  Future<void> onAddRemoveBookPressed(Book book, bool hasTheBook) async {
    final user = await ref.watch(readerProvider.future);

    if (hasTheBook) {
      await ReaderRepo.removeBookFromUser(bookId: book.id, userId: user.id);
    } else {
      await BookRepo.addBook(book: book);
      await ReaderRepo.addBookToUser(bookId: book.id, userId: user.id);
    }
  }

  void onAddReviewTap(Book book) {
    EasyNavigator.openPage(
        context: context,
        page: AddReviewScreen(
          book: book,
        ));
  }

  Future<void> addBookToGroup(Book book) async {
    GroupBook groupBook = GroupBook(
      bookId: book.id!,
      // startEndDate: StartEndDate(
      //   startDate: DateTime.now(),
      //   endDate: DateTime.now().add(Duration(days: 7)),
      // ),
    );

    BookRepo.addBookToGroup(
        groupBook: groupBook, groupId: ref.read(currentGroupIdProvider));
    EasyNavigator.popPage(context);
    EasyNavigator.popPage(context);
  }
}
