import 'package:Qaree/features/book_search/providers/book_search_provider.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/services/google_books_api.dart';
import 'package:Qaree/widgets/book_image.dart';
import 'package:Qaree/widgets/bounce.dart';
import 'package:Qaree/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/enums/book_genre.dart';
import 'package:Qaree/features/book_search/controllers/book_search_controller.dart';
import 'package:Qaree/widgets/custom_textfield/custom_textfield.dart';
import 'package:Qaree/widgets/custom_textfield/textfield_types.dart';

class BookSearchScreen extends ConsumerStatefulWidget {
  const BookSearchScreen({super.key});

  @override
  ConsumerState<BookSearchScreen> createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends ConsumerState<BookSearchScreen> {
  late final BookSearchController _controller;
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  final _books = <Book>[];
  int _startIndex = 0;
  bool _isLoading = false;
  // late final List<Book>? books;
  var genres = BookGenre.values;

  @override
  void didChangeDependencies() {
    _controller = BookSearchController(context: context, ref: ref);
    super.didChangeDependencies();
  }

  void _loadBooks() async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
    final books = await GoogleBooksApi.getBooksByName(
      _textController.text,
      _startIndex,
      10, // Load 10 books at a time
    );
    setState(() {
      _books.addAll(books);
      _startIndex += books.length;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadBooks();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.lightGreyPrimary,
      appBar: CustomAppBar(context: context, title: "Book Search"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SpacingConst.vSpacing16,
            CustomTextField(
              type: TextFieldType.normal,
              controller: _textController,
              width: 348.w,
              height: 49.h,
              placeHolderText: "Search",
              color: ColorsConst.lightPurple,
              icon: Icons.search,
              onSubmit: (value) {
                setState(() {
                  _books.clear();
                  _startIndex = 0;
                });
                _loadBooks();
              },
            ),
            Expanded(
              child: _isLoading && _books.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      child: GridView.builder(
                        controller: _scrollController,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 30.w,
                          crossAxisSpacing: 30.h,
                          mainAxisExtent: 230.h,
                        ),
                        itemCount: _books.length + (_isLoading ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index < _books.length) {
                            return BounceAnimation(
                              onTap: () {
                                _controller.onBookTap(_books[index]);
                              },
                              child: BookImage(
                                book: _books[index],
                              ),
                            );
                          } else {
                            return Center(
                              child: _isLoading
                                  ? CircularProgressIndicator()
                                  : SizedBox.shrink(),
                            );
                          }
                        },
                      ),
                    ),
            ),
            SpacingConst.vSpacing30,
          ],
        ),
      ),
    );
  }
}
