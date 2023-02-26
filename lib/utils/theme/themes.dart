import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/fonts_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainTheme {
  static final main = ThemeData(
      fontFamily: FontConst.fontFamily,
      scaffoldBackgroundColor: ColorsConst.white,
      primaryColor: ColorsConst.black,
      dividerColor: Colors.transparent,
      colorScheme: ColorScheme.light(
        primary: ColorsConst.black,
        secondary: ColorsConst.white,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 96.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        headline2: TextStyle(
          fontSize: 60.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        headline3: TextStyle(
          fontSize: 48.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        headline4: TextStyle(
          fontSize: 34.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        headline5: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        headline6: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        subtitle1: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        subtitle2: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        bodyText1: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        bodyText2: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        button: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        caption: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        overline: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      backgroundColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorsConst.white,
        elevation: 0,
      ));
}
