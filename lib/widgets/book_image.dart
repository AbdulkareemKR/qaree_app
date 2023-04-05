import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/box_shadow_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Qaree/utils/theme/extensions.dart';

class BookImage extends StatelessWidget {
  final Book book;
  final double width;
  final double height;

  const BookImage({
    Key? key,
    required this.book,
    this.width = 90,
    this.height = 134,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusConst.verySmallBorderRadius,
        color: book.image == null ? ColorsConst.lightGrey : null,
        boxShadow: [BoxShadowConst.rightBottomBoxShadow],
      ),
      width: width.w,
      height: height.h,
      child: book.image != null
          ? ClipRRect(
              borderRadius: BorderRadiusConst.verySmallBorderRadius,
              child: Image.network(
                book.image!,
                fit: BoxFit.fill,
              ),
            )
          : Padding(
              padding: EdgeInsets.all(10.w),
              child: Center(
                child: Text(
                  book.name ?? "Unknown",
                  style: context.textThemes.titleLarge?.copyWith(
                    fontFamily: "JosefinSans",
                    color: ColorsConst.darkGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
    );
  }
}
