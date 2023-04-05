import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/box_shadow_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/book_search/controllers/book_search_controller.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/models/note/note.dart';
import 'package:Qaree/services/date_time_services.dart';
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
      appBar: AppBar(
          backgroundColor: ColorsConst.primaryBlack,
          bottom: PreferredSize(
            preferredSize: Size(1, 250.h),
            child: FadeInUp(
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BookImage(
                              book: widget.book,
                              width: 90,
                              height: 134,
                            ),
                            SpacingConst.hSpacing20,
                            Container(
                              width: 230.w,
                              child: Column(
                                children: [
                                  Text(
                                    widget.book.name ?? "Unknown",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: context.textThemes.titleMedium
                                        ?.copyWith(
                                      fontFamily: "JosefinSans",
                                      color: ColorsConst.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SpacingConst.vSpacing16,
                                  Text(
                                    widget.book.description ?? "Unknown",
                                    style:
                                        context.textThemes.bodyMedium?.copyWith(
                                      fontFamily: "JosefinSans",
                                      color: ColorsConst.grey,
                                    ),
                                    maxLines: 7,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SpacingConst.vSpacing120,
                      ],
                    ),
                    Positioned(
                      bottom: -50.h,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 330.w,
                            child: Row(
                              children: [
                                BounceAnimation(
                                  onTap: () {},
                                  child: Container(
                                    width: 30.w,
                                    height: 30.w,
                                    decoration: BoxDecoration(
                                      color: ColorsConst.grey,
                                      borderRadius: BorderRadiusConst
                                          .verySmallBorderRadius,
                                    ),
                                    child: Icon(
                                      Icons.library_books,
                                      size: 20.sp,
                                      color: ColorsConst.white,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                BounceAnimation(
                                  onTap: () {},
                                  child: Container(
                                    width: 30.w,
                                    height: 30.w,
                                    decoration: BoxDecoration(
                                      color: ColorsConst.primaryPurple,
                                      borderRadius: BorderRadiusConst
                                          .verySmallBorderRadius,
                                    ),
                                    child: Icon(
                                      CupertinoIcons.pen,
                                      size: 20.sp,
                                      color: ColorsConst.white,
                                    ),
                                  ),
                                ),
                                SpacingConst.hSpacing20,
                                Container(
                                  width: 30.w,
                                  height: 30.w,
                                  decoration: BoxDecoration(
                                    color: ColorsConst.primaryPurple,
                                    borderRadius:
                                        BorderRadiusConst.verySmallBorderRadius,
                                  ),
                                  child: Icon(
                                    Icons.play_circle_outline_rounded,
                                    size: 22.sp,
                                    color: ColorsConst.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SpacingConst.vSpacing16,
                          Container(
                            width: 350.w,
                            height: 92.h,
                            decoration: BoxDecoration(
                              color: ColorsConst.white,
                              borderRadius: BorderRadiusConst.smallBorderRadius,
                              boxShadow: [BoxShadowConst.allSidesBoxShadow],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 10.h),
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10.h),
                                    decoration: BoxDecoration(
                                      color: ColorsConst.primaryPurple,
                                      borderRadius:
                                          BorderRadiusConst.mediumBorderRadius,
                                    ),
                                    child: Icon(
                                      Icons.group,
                                      size: 30.sp,
                                      color: ColorsConst.white,
                                    ),
                                  ),
                                  SpacingConst.hSpacing16,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SpacingConst.vSpacing16,
                                      Text(
                                        "Authors",
                                        style: context.textThemes.bodySmall
                                            ?.copyWith(
                                          fontFamily: "JosefinSans",
                                          color: ColorsConst.grey,
                                        ),
                                      ),
                                      SpacingConst.vSpacing8,
                                      SizedBox(
                                        height: 35.h,
                                        width: 200.w,
                                        child: widget.book.authors?.length ==
                                                null
                                            ? ListView.separated(
                                                shrinkWrap: true,
                                                separatorBuilder:
                                                    (context, index) =>
                                                        SpacingConst.vSpacing8,
                                                itemCount: widget
                                                        .book.authors?.length ??
                                                    0,
                                                itemBuilder: (context, index) {
                                                  return Text(
                                                    widget.book.authors![index],
                                                    style: context
                                                        .textThemes.bodyLarge
                                                        ?.copyWith(
                                                      fontFamily: "JosefinSans",
                                                      color: ColorsConst
                                                          .primaryBlack,
                                                    ),
                                                  );
                                                },
                                              )
                                            : Text(
                                                "Unknown",
                                                style: context
                                                    .textThemes.bodyLarge
                                                    ?.copyWith(
                                                  fontFamily: "JosefinSans",
                                                  color:
                                                      ColorsConst.primaryBlack,
                                                ),
                                              ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
