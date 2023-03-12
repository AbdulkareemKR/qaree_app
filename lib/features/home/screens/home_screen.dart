import 'dart:developer';
import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/box_shadow_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/home/controllers/home_screen_controller.dart';
import 'package:Qaree/features/home/providers/home_screen_providers.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/repos/book_repo.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:Qaree/widgets/bounce.dart' as Bounce;
import 'package:Qaree/widgets/loading_container.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final HomeScreenController _controller;

  @override
  void didChangeDependencies() {
    _controller = HomeScreenController(context: context, ref: ref);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(readerProvider);
    return user.when(
      data: (user) => Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsConst.primaryBlack,
          title: Text(
            'Book Shelf',
            style: context.textThemes.displayMedium?.copyWith(
              fontFamily: "JosefinSans",
              color: ColorsConst.white,
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        backgroundColor: ColorsConst.lightGrey,
        body: SafeArea(
          child: Column(
            children: [
              SpacingConst.vSpacing60,
              Container(
                height: 310.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: user.books?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Consumer(
                        builder: ((context, ref, child) => ref
                            .watch(BookRepo.getBookByIdProvider(
                                user.books![index]))
                            .when(
                                data: (book) => FadeInUp(
                                      duration: Duration(milliseconds: 500),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w),
                                        child: Bounce.Bounce(
                                          duration:
                                              Duration(milliseconds: 2000),
                                          onTap: () =>
                                              _controller.onBookTap(index),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 180.w,
                                                height: 270.h,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadowConst
                                                        .rightBottomBoxShadow
                                                  ],
                                                ),
                                                child: book?.image != null
                                                    ? ClipRRect(
                                                        borderRadius:
                                                            BorderRadiusConst
                                                                .verySmallBorderRadius,
                                                        child: Image.network(
                                                          book!.image!,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      )
                                                    : Text(book?.name ??
                                                        "Unknown"),
                                              ),
                                              SpacingConst.vSpacing16,
                                              Text(
                                                book?.name ?? "Unknown",
                                                style: context
                                                    .textThemes.bodyLarge
                                                    ?.copyWith(
                                                  fontFamily: "JosefinSans",
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                error: (error, stack) =>
                                    Text("An Error Ocurred"),
                                loading: () => Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.w),
                                      child: LoadingContainer(
                                        width: 180.w,
                                        height: 270.h,
                                      ),
                                    ))));
                  },
                ),
              ),
              SpacingConst.vSpacing60,
              Consumer(builder: ((context, ref, child) {
                final selectedBook = ref.watch(selectedBookIndexProvider);
                return user.books == null
                    ? Text("No Books")
                    : ref
                        .watch(BookRepo.getBookByIdProvider(
                            user.books![selectedBook]))
                        .when(
                            data: (book) => FadeInUp(
                                  duration: Duration(milliseconds: 500),
                                  child: Bounce.Bounce(
                                    onTap: () => _controller.onBookCardTap(
                                        book!,
                                        user.notes
                                            ?.where((note) =>
                                                note.bookId == book.id)
                                            .toList()),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 25.w),
                                      width: 385.w,
                                      height: 250.h,
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadowConst.rightBottomBoxShadow
                                        ],
                                        color: ColorsConst.white,
                                        borderRadius: BorderRadiusConst
                                            .mediumBorderRadius,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 113.0,
                                            height: 168.h,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadowConst
                                                    .rightBottomBoxShadow
                                              ],
                                            ),
                                            child: book?.image != null
                                                ? ClipRRect(
                                                    borderRadius: BorderRadiusConst
                                                        .verySmallBorderRadius,
                                                    child: Image.network(
                                                      book!.image!,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                                : Text(book?.name ?? "Unknown"),
                                          ),
                                          SpacingConst.hSpacing20,
                                          Container(
                                            width: 180.w,
                                            child: Column(
                                              children: [
                                                SpacingConst.vSpacing30,
                                                Text(
                                                  book?.name ?? "Unknown",
                                                  maxLines: 2,
                                                  textAlign: TextAlign.center,
                                                  style: context
                                                      .textThemes.titleSmall
                                                      ?.copyWith(
                                                    fontFamily: "JosefinSans",
                                                    color: ColorsConst.darkGrey,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                SpacingConst.vSpacing16,
                                                Text(
                                                  book?.description ??
                                                      "Unknown",
                                                  style: context
                                                      .textThemes.bodyMedium
                                                      ?.copyWith(
                                                    fontFamily: "JosefinSans",
                                                    color: ColorsConst.grey,
                                                  ),
                                                  maxLines: 7,
                                                  textAlign: TextAlign.center,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                SpacingConst.vSpacing16,
                                                Bounce.Bounce(
                                                  onTap: () => {},
                                                  child: Container(
                                                    width: 70.w,
                                                    height: 24.h,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 5.w,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: ColorsConst
                                                          .primaryPurple,
                                                      borderRadius:
                                                          BorderRadiusConst
                                                              .circularBorderRadius,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .play_circle_outline_rounded,
                                                          color:
                                                              ColorsConst.white,
                                                          size: 20.sp,
                                                        ),
                                                        SizedBox(
                                                          height: 17.h,
                                                          child:
                                                              VerticalDivider(
                                                            thickness: 2.sp,
                                                            color: ColorsConst
                                                                .white,
                                                          ),
                                                        ),
                                                        Icon(
                                                          CupertinoIcons.pen,
                                                          color:
                                                              ColorsConst.white,
                                                          size: 20.sp,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            error: (error, stack) => Text("An Error Ocurred"),
                            loading: () => Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 25.w),
                                  child: LoadingContainer(
                                    width: 385.w,
                                    height: 231.h,
                                  ),
                                ));
              })),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => Text("An error Ocurred"),
      loading: () => LoadingContainer(),
    );
  }
}
