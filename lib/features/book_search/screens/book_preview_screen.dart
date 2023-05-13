import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/box_shadow_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/book_search/controllers/book_search_controller.dart';
import 'package:Qaree/features/groups/groups_providers/groups_provider.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/repos/reader_repo.dart';
import 'package:Qaree/repos/review_repo.dart';
import 'package:Qaree/services/date_time_services.dart';
import 'package:Qaree/widgets/book_image.dart';
import 'package:Qaree/widgets/bounce.dart';
import 'package:Qaree/widgets/custom_button/custom_button.dart';
import 'package:Qaree/widgets/loading_container.dart';
import 'package:Qaree/widgets/rating_stars.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Qaree/utils/theme/extensions.dart';

class BookPreviewScreen extends ConsumerStatefulWidget {
  final Book book;
  const BookPreviewScreen({required this.book, super.key});

  @override
  ConsumerState<BookPreviewScreen> createState() => _BookPreviewScreenState();
}

class _BookPreviewScreenState extends ConsumerState<BookPreviewScreen> {
  late final BookSearchController _controller;

  @override
  void didChangeDependencies() {
    _controller = BookSearchController(context: context, ref: ref);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.veryLightGrey,
      appBar: AppBar(
        backgroundColor: ColorsConst.transparent,
        iconTheme: IconThemeData(
          color: ColorsConst.primaryBlack,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: ListView(
          children: [
            FadeInUp(
              duration: Duration(milliseconds: 500),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BookImage(
                        book: widget.book,
                        width: 120.w,
                        height: 180.h,
                      ),
                      SpacingConst.hSpacing20,
                      Container(
                        width: 210.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SpacingConst.vSpacing16,
                            Text(
                              widget.book.name ?? "Unknown",
                              maxLines: 10,
                              style: context.textThemes.titleMedium?.copyWith(
                                fontFamily: "JosefinSans",
                                color: ColorsConst.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SpacingConst.vSpacing16,
                            Text(
                              widget.book.authors?.first ?? "Unknown",
                              style: context.textThemes.bodyMedium?.copyWith(
                                fontFamily: "JosefinSans",
                                color: ColorsConst.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SpacingConst.vSpacing16,
                            RatingStars(
                                rating: widget.book.rating?.toDouble() ?? 0),
                            SpacingConst.vSpacing16,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                !ref.watch(isGroupBookAddedProvider)
                                    ? Consumer(builder: (context, ref, child) {
                                        return ref.watch(readerProvider).when(
                                            data: (user) {
                                              final hasTheBook = user.books
                                                              ?.contains(widget
                                                                  .book.id) ==
                                                          null ||
                                                      user.books?.contains(
                                                              widget.book.id) ==
                                                          false
                                                  ? false
                                                  : true;
                                              return Center(
                                                child: BounceAnimation(
                                                  onTap: () async =>
                                                      await _controller
                                                          .onAddRemoveBookPressed(
                                                              widget.book,
                                                              hasTheBook),
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(5.h),
                                                    width: 90.w,
                                                    height: 30.w,
                                                    decoration: BoxDecoration(
                                                      color: hasTheBook
                                                          ? ColorsConst
                                                              .negativeRed
                                                          : ColorsConst
                                                              .primaryPurple,
                                                      borderRadius:
                                                          BorderRadiusConst
                                                              .verySmallBorderRadius,
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          hasTheBook
                                                              ? CupertinoIcons
                                                                  .minus_circled
                                                              : CupertinoIcons
                                                                  .plus_circled,
                                                          size: 20.sp,
                                                          color:
                                                              ColorsConst.white,
                                                        ),
                                                        SpacingConst.hSpacing6,
                                                        Text(
                                                          hasTheBook
                                                              ? "Remove"
                                                              : "Add",
                                                          style: context
                                                              .textThemes
                                                              .bodyMedium
                                                              ?.copyWith(
                                                            fontFamily:
                                                                "JosefinSans",
                                                            color: ColorsConst
                                                                .white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                            loading: () => LoadingContainer(),
                                            error: (error, stack) =>
                                                Text("Error"));
                                      })
                                    : BounceAnimation(
                                        onTap: () => _controller
                                            .addBookToGroup(widget.book),
                                        child: Container(
                                          padding: EdgeInsets.all(5.h),
                                          width: 140.w,
                                          height: 30.w,
                                          decoration: BoxDecoration(
                                            color: ColorsConst.positiveGreen,
                                            borderRadius: BorderRadiusConst
                                                .verySmallBorderRadius,
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                CupertinoIcons.plus_circled,
                                                size: 20.sp,
                                                color: ColorsConst.white,
                                              ),
                                              SpacingConst.hSpacing6,
                                              Text(
                                                "Add to Group",
                                                style: context
                                                    .textThemes.bodyMedium
                                                    ?.copyWith(
                                                  fontFamily: "JosefinSans",
                                                  color: ColorsConst.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            FadeInUp(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpacingConst.vSpacing16,
                  Divider(
                    color: ColorsConst.grey,
                    thickness: 0.2.h,
                  ),
                  SpacingConst.vSpacing16,
                  Text(
                    "About the Book",
                    style: context.textThemes.displaySmall?.copyWith(
                      fontFamily: "JosefinSans",
                      color: ColorsConst.grey,
                    ),
                  ),
                  SpacingConst.vSpacing8,
                  Center(
                    child: Container(
                      width: 370.w,
                      decoration: BoxDecoration(
                        color: ColorsConst.white,
                        borderRadius: BorderRadiusConst.smallBorderRadius,
                        boxShadow: [BoxShadowConst.allSidesBoxShadow],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.w, vertical: 15.h),
                        child: SizedBox(
                          width: 330.w,
                          child: Text(
                            widget.book.description ?? "Unknown",
                            style: context.textThemes.headlineSmall?.copyWith(
                              fontFamily: "JosefinSans",
                              color: ColorsConst.primaryBlack,
                              height: 1.5.h,
                            ),
                            maxLines: 100,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SpacingConst.vSpacing16,
                  Divider(
                    color: ColorsConst.grey,
                    thickness: 0.2.h,
                  ),
                  SpacingConst.vSpacing6,
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Reviews",
                      style: context.textThemes.displaySmall?.copyWith(
                        fontFamily: "JosefinSans",
                        color: ColorsConst.grey,
                      ),
                    ),
                    Center(
                      child: BounceAnimation(
                        onTap: () => _controller.onAddReviewTap(widget.book),
                        child: Container(
                          padding: EdgeInsets.all(5.h),
                          height: 30.w,
                          decoration: BoxDecoration(
                            color: ColorsConst.infoBlue,
                            borderRadius:
                                BorderRadiusConst.verySmallBorderRadius,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                CupertinoIcons.plus_circled,
                                size: 20.sp,
                                color: ColorsConst.white,
                              ),
                              SpacingConst.hSpacing6,
                              Text(
                                "Write a Review",
                                style: context.textThemes.bodyMedium?.copyWith(
                                  fontFamily: "JosefinSans",
                                  color: ColorsConst.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SpacingConst.vSpacing16,
                Consumer(builder: (context, ref, child) {
                  final review = ref.watch(
                      ReviewRepo.getReviewByBookIdProvider(widget.book.id!));
                  return review.when(
                      data: (review) => ListView.separated(
                            shrinkWrap: true,
                            itemCount: review.length,
                            separatorBuilder: ((context, index) =>
                                SpacingConst.vSpacing16),
                            itemBuilder: (context, index) {
                              final userReview = review[index];
                              final username = ref.watch(
                                  ReaderRepo.getUserByIdProvider(
                                      userReview.userId!));

                              return Container(
                                padding: EdgeInsets.all(10.0.h),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadiusConst.smallBorderRadius,
                                  color: ColorsConst.lightGrey,
                                  boxShadow: [
                                    BoxShadowConst.rightBottomBoxShadow
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        username.maybeWhen(
                                          orElse: () => LoadingContainer(
                                            width: 30,
                                            height: 20,
                                          ),
                                          data: (user) => Text(
                                            user?.name ?? "Unknown",
                                            style: context.textThemes.bodyMedium
                                                ?.copyWith(
                                              fontFamily: "JosefinSans",
                                              color: ColorsConst.grey,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              DateTimeServices
                                                  .getFullDateAsLetterMonth(
                                                      dateTime:
                                                          userReview.date),
                                              style: context
                                                  .textThemes.bodyMedium
                                                  ?.copyWith(
                                                fontFamily: "JosefinSans",
                                                color: ColorsConst.grey,
                                              ),
                                            ),
                                            SizedBox(width: 8.0),
                                            RatingStars(
                                                rating: userReview.rating
                                                        ?.toDouble() ??
                                                    0),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8.0),
                                    Text(
                                      userReview.reviewContent ?? "",
                                      style: context.textThemes.headlineSmall
                                          ?.copyWith(
                                        color: ColorsConst.black,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                      error: (error, stackTrace) =>
                          Center(child: Text("An error occurred")),
                      loading: () => LoadingContainer(
                            height: 300.h,
                            width: 300.w,
                          ));
                }),
                SpacingConst.vSpacing40,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
