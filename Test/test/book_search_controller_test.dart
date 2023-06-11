// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';
// import 'package:Qaree/features/book_search/controllers/book_search_controller.dart';
// import 'package:Qaree/features/book_search/providers/book_search_provider.dart';
// import 'package:Qaree/features/book_search/screens/book_preview_screen.dart';
// import 'package:Qaree/models/book/book.dart';
// import 'package:Qaree/services/easy_navigator.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// // Mock class for the context
// class MockBuildContext extends Mock implements BuildContext {}

// // Mock class for the WidgetRef
// class MockWidgetRef extends Mock implements WidgetRef {}

// // Mock class for the TextEditingController
// class MockTextEditingController extends Mock implements TextEditingController {}

// void main() {
//   late MockBuildContext mockContext;
//   late MockWidgetRef mockWidgetRef;
//   late MockTextEditingController mockTextEditingController;
//   late BookSearchController bookSearchController;

//   setUp(() {
//     mockContext = MockBuildContext();
//     mockWidgetRef = MockWidgetRef();
//     mockTextEditingController = MockTextEditingController();

//     bookSearchController = BookSearchController(
//       context: mockContext,
//       ref: mockWidgetRef,
//     );

//     bookSearchController.bookSearch = mockTextEditingController;
//   });

//   test('onSearchSubmit should update bookSearchQueryProvider state', () {
//     const bookName = 'Sample Book';

//     bookSearchController.onSearchSubmit(bookName);

//     verify(mockWidgetRef
//             .read(BookSearchProvider.bookSearchQueryProvider.notifier)
//             .state = bookName)
//         .called(1);
//   });

//   test('onBookTap should open BookPreviewScreen', () {
//     final mockBook = Book(name: 'Mock Book');

//     bookSearchController.onBookTap(mockBook);

//     verify(EasyNavigator.openPage(
//       context: mockContext,
//       page: BookPreviewScreen(book: mockBook),
//     )).called(1);
//   });
// }
