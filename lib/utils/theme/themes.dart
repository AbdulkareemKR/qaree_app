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
        displayLarge: TextStyle(
          fontSize: 48.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        displayMedium: TextStyle(
          fontSize: 36.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        displaySmall: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        headlineLarge: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        headlineMedium: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        headlineSmall: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        titleLarge: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        titleMedium: TextStyle(
          fontSize: 20.sp, 
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        titleSmall: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        labelLarge: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        labelMedium: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: ColorsConst.darkGrey,
        ),
        labelSmall: TextStyle(
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
