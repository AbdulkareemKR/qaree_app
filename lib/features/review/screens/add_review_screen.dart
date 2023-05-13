import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/fonts_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/review/controllers/review_controller.dart';
import 'package:Qaree/features/review/providers/review_providers.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/models/review/review.dart';
import 'package:Qaree/widgets/book_image.dart';
import 'package:Qaree/widgets/custom_app_bar.dart';
import 'package:Qaree/widgets/custom_button/custom_button.dart';
import 'package:Qaree/widgets/custom_button/enums/button_style.dart';
import 'package:Qaree/widgets/rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Qaree/utils/theme/extensions.dart';

class AddReviewScreen extends ConsumerStatefulWidget {
  const AddReviewScreen({this.currentReview, super.key, required this.book});

  @override
  ConsumerState<AddReviewScreen> createState() => _AddReviewScreenState();

  final Book book;
  final Review? currentReview;
}

class _AddReviewScreenState extends ConsumerState<AddReviewScreen> {
  late final ReviewScreenController _controller;

  @override
  void initState() {
    _controller = ReviewScreenController(context: context, ref: ref);
    _controller.getCurrentReview(widget.book.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.veryLightGrey,
      appBar: CustomAppBar(
        context: context,
        title: 'Review',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SpacingConst.vSpacing20,
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    left: 20.w,
                    top: 40.h,
                    bottom: 40.h,
                    right: 55.w,
                  ),
                  width: 200.6.w,
                  height: 250.02.h,
                  decoration: BoxDecoration(
                    color: ColorsConst.lightGrey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(360),
                      bottomRight: Radius.circular(360),
                    ),
                  ),
                  child: BookImage(
                    book: widget.book,
                  ),
                ),
                SizedBox(
                  width: 210.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpacingConst.vSpacing40,
                      Text(
                        widget.book.name ?? 'unknown',
                        style: context.textThemes.titleMedium?.copyWith(
                          fontFamily: FontConst.mainFontFamily,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        widget.book.authors?.first ?? 'unknown',
                        style: context.textThemes.bodyMedium?.copyWith(
                          fontFamily: FontConst.mainFontFamily,
                          fontWeight: FontWeight.w300,
                          color: ColorsConst.grey,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            RatingStars(
              isEditable: true,
              rating: ref.watch(ReviewProvider.bookRatingProvider),
              size: 50,
            ),
            Container(
                padding: EdgeInsets.all(16.w),
                child: SizedBox(
                  width: 350.w,
                  height: 250.h,
                  child: TextField(
                    controller: _controller.reviewTextController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadiusConst.smallBorderRadius,
                        borderSide:
                            BorderSide(width: 1, color: ColorsConst.lightGrey),
                      ),
                      hintText: "write Down your thoughts",
                      hintStyle: context.textThemes.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w300,
                        color: ColorsConst.grey,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadiusConst.smallBorderRadius,
                        borderSide: BorderSide(
                            width: 1, color: ColorsConst.primaryPurple),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadiusConst.smallBorderRadius,
                        borderSide:
                            BorderSide(width: 1, color: ColorsConst.lightGrey),
                      ),
                      fillColor: ColorsConst.white,
                      filled: true,
                    ),
                  ),
                )),
            CustomButton(
              label: "Save Review",
              onPressed: () async =>
                  await _controller.onAddReviewPressed(widget.book.id),
              style: CustomButtonStyle.primary,
              textStyle: context.textThemes.bodyMedium?.copyWith(
                color: ColorsConst.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
