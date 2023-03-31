import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/models/book/book.dart';
import 'package:Qaree/widgets/bounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartSessionWidget extends StatelessWidget {
  final void Function() onTap;

  const StartSessionWidget({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BounceAnimation(
      onTap: onTap,
      child: Container(
        width: 70.w,
        height: 24.h,
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
        ),
        decoration: BoxDecoration(
          color: ColorsConst.primaryPurple,
          borderRadius: BorderRadiusConst.circularBorderRadius,
        ),
        child: Row(
          children: [
            Icon(
              Icons.play_circle_outline_rounded,
              color: ColorsConst.white,
              size: 20.sp,
            ),
            SizedBox(
              height: 17.h,
              child: VerticalDivider(
                thickness: 2.sp,
                color: ColorsConst.white,
              ),
            ),
            Icon(
              CupertinoIcons.pen,
              color: ColorsConst.white,
              size: 20.sp,
            ),
          ],
        ),
      ),
    );
  }
}
