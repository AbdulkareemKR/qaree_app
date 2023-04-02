import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/enums/book_genre.dart';
import 'package:Qaree/features/book_search/controllers/book_search_controller.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:Qaree/widgets/custom_textfield/custom_textfield.dart';
import 'package:Qaree/widgets/custom_textfield/textfield_types.dart';
import 'package:Qaree/widgets/custom_book_card/custom_book_card.dart';
import 'package:Qaree/widgets/custom_weekly_book/custom_weekly_book.dart';
import 'package:Qaree/widgets/custom_book_genre/custom_book_genre.dart';

class BookSearchScreen extends ConsumerStatefulWidget {
  const BookSearchScreen({super.key});

  @override
  ConsumerState<BookSearchScreen> createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends ConsumerState<BookSearchScreen> {
  late final BookSearchController _controller;
  // late final List<Book>? books;
  var genres = BookGenre.values;

  @override
  void didChangeDependencies() {
    _controller = BookSearchController(context: context, ref: ref);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var book = {"name": "A Much recorded war", "author": "Frederic A. Sharf"};

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
              controller: _controller.bookSearch,
              width: 348.w,
              height: 49.h,
              placeHolderText: "Search",
              color: ColorsConst.lightPurple,
              icon: Icons.search,
              onSubmit: (value) {
                _controller.getBooksByQueryProvider(value);
              },
            ),
            SpacingConst.vSpacing40,
            Text(
              "Book of the Week",
              style: context.textThemes.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SpacingConst.vSpacing20,
            Container(
              width: 400.w,
              height: 250.h,
              decoration: BoxDecoration(
                color: ColorsConst.lightGrey,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.w),
                    bottomRight: Radius.circular(30.w)),
              ),
              child: CustomWeeklyBook(),
            ),
            SpacingConst.vSpacing20,
            Container(
              width: double.infinity,
              height: 30.h,
              child: Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...genres
                          .map((genre) =>
                              CustomBookGenre(genre: genre.name.toString()))
                          .toList(),
                    ],
                  ),
                ),
              ),
            ),
            SpacingConst.vSpacing60,
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 256,
                ),
                itemCount: 30,
                itemBuilder: (context, index) {
                  return CustomBookCard(
                    book: book,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
