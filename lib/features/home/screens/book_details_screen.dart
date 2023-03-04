import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/box_shadow_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/home/controllers/home_screen_controller.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/models/note/note.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Qaree/utils/theme/extensions.dart';

class BookDetailsScreen extends ConsumerStatefulWidget {
  final Book book;
  final List<Note>? notes;
  const BookDetailsScreen({required this.book, required this.notes, super.key});

  @override
  ConsumerState<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends ConsumerState<BookDetailsScreen> {
  late final HomeScreenController _controller;

  @override
  void didChangeDependencies() {
    _controller = HomeScreenController(context: context, ref: ref);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.lightGrey,
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
                            Container(
                              width: 90.0,
                              height: 134.h,
                              decoration: BoxDecoration(),
                              child: widget.book.image != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadiusConst
                                          .verySmallBorderRadius,
                                      child: Image.network(
                                        widget.book.image!,
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : Text(widget.book.name ?? "Unknown"),
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
                      child: Container(
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
                                  CupertinoIcons.pen,
                                  size: 30.sp,
                                  color: ColorsConst.white,
                                ),
                              ),
                              SpacingConst.hSpacing16,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SpacingConst.vSpacing16,
                                  Text(
                                    "Authors",
                                    style:
                                        context.textThemes.bodySmall?.copyWith(
                                      fontFamily: "JosefinSans",
                                      color: ColorsConst.grey,
                                    ),
                                  ),
                                  SpacingConst.vSpacing8,
                                  SizedBox(
                                    height: 35.h,
                                    width: 200.w,
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      separatorBuilder: (context, index) =>
                                          SpacingConst.vSpacing8,
                                      itemCount:
                                          widget.book.authors?.length ?? 0,
                                      itemBuilder: (context, index) {
                                        return Text(
                                          widget.book.authors?[index] ??
                                              "Unknown",
                                          style: context.textThemes.bodyLarge
                                              ?.copyWith(
                                            fontFamily: "JosefinSans",
                                            color: ColorsConst.primaryBlack,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Center(
            child: Column(
              children: [
                SpacingConst.vSpacing80,
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: widget.notes?.length ?? 0,
                  separatorBuilder: ((context, index) =>
                      SpacingConst.vSpacing20),
                  itemBuilder: (context, index) => Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                      color: ColorsConst.lightPurple.withOpacity(0.80),
                      borderRadius: BorderRadiusConst.smallBorderRadius,
                      boxShadow: [BoxShadowConst.allSidesBoxShadow],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.notes![index].date.toString(),
                                style: context.textThemes.bodyMedium?.copyWith(
                                  fontFamily: "JosefinSans",
                                  color: ColorsConst.grey,
                                ),
                              ),
                            ],
                          ),
                          SpacingConst.vSpacing8,
                          Text(
                            widget.notes![index].noteTitle.toString(),
                            style: context.textThemes.titleLarge?.copyWith(
                              fontFamily: "JosefinSans",
                              color: ColorsConst.primaryBlack,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(color: ColorsConst.grey, thickness: 1.sp),
                          SpacingConst.vSpacing8,
                          Text(
                            widget.notes![index].noteContent.toString(),
                            style: context.textThemes.bodyMedium?.copyWith(
                              fontFamily: "JosefinSans",
                              color: ColorsConst.primaryBlack,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
