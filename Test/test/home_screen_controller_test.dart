import 'package:Qaree/features/home/controllers/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:Qaree/features/home/providers/home_screen_providers.dart';
import 'package:Qaree/features/home/screens/book_details_screen.dart';
import 'package:Qaree/features/reading_session/screens/reading_session_screen.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/models/note/note.dart';
import 'package:Qaree/services/easy_navigator.dart';

import 'statistics_controller_test.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  late HomeScreenController homeScreenController;
  late BuildContext mockContext;
  late WidgetRef mockRef;

  setUp(() {
    mockContext = MockBuildContext();
    mockRef = MockWidgetRef();
    homeScreenController =
        HomeScreenController(context: mockContext, ref: mockRef);
  });

  group('HomeScreenController', () {
    test('onBookTap should update selectedBookIndexProvider', () {
      final mockNotifier =
          MockProviderContainer().read(selectedBookIndexProvider.notifier);
      const int bookIndex = 0;

      homeScreenController.onBookTap(bookIndex);

      verify(mockNotifier.state = bookIndex).called(1);
    });

    test('onBookCardTap should open BookDetailsScreen', () {
      final mockBook = Book();
      final mockNotes = <Note>[];
      const mockPage = BookDetailsScreen(book: mockBook, notes: mockNotes);

      homeScreenController.onBookCardTap(mockBook, mockNotes);

      verify(EasyNavigator.openPage(context: mockContext, page: mockPage))
          .called(1);
    });

    test('onStartSessionTap should open ReadingSessionScreen', () {
      final mockBook = Book();
      const mockPage = ReadingSessionScreen(book: mockBook);

      homeScreenController.onStartSessionTap(mockBook);

      verify(EasyNavigator.openPage(context: mockContext, page: mockPage))
          .called(1);
    });
  });
}
