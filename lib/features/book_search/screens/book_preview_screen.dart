import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/box_shadow_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/book_search/controllers/book_search_controller.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/widgets/book_image.dart';
import 'package:Qaree/widgets/bounce.dart';
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Rating: ${widget.book.rating ?? "Unknown"}",
                                  style:
                                      context.textThemes.bodyMedium?.copyWith(
                                    fontFamily: "JosefinSans",
                                    color: ColorsConst.primaryBlack,
                                  ),
                                ),
                                SpacingConst.hSpacing6,
                                Icon(
                                  CupertinoIcons.star_fill,
                                  color: ColorsConst.warningYellow,
                                  size: 20.sp,
                                ),
                              ],
                            ),
                            SpacingConst.vSpacing16,
                            Center(
                              child: BounceAnimation(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(5.h),
                                  width: 70.w,
                                  height: 30.w,
                                  decoration: BoxDecoration(
                                    color: ColorsConst.primaryPurple,
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
                                        "Add",
                                        style: context.textThemes.bodyMedium
                                            ?.copyWith(
                                          fontFamily: "JosefinSans",
                                          color: ColorsConst.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
            Container(
              width: 350.w,
              decoration: BoxDecoration(
                color: ColorsConst.white,
                borderRadius: BorderRadiusConst.smallBorderRadius,
                boxShadow: [BoxShadowConst.allSidesBoxShadow],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: SizedBox(
                  width: 330.w,
                  child: Text(
                    widget.book.description ?? "Unknown",
                    style: context.textThemes.bodyLarge?.copyWith(
                      fontFamily: "JosefinSans",
                      color: ColorsConst.primaryBlack,
                      height: 1.5.h,
                    ),
                    maxLines: 100,
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
            Text(
              "Reviews",
              style: context.textThemes.displaySmall?.copyWith(
                fontFamily: "JosefinSans",
                color: ColorsConst.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
