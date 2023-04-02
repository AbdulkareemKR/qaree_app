import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      color: ColorsConst.lightPurple.withOpacity(0.80),
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
          : Text(book.name ?? "Unknown"),
    );
  }
}
