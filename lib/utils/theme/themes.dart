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
          headlineLarge: TextStyle(
              fontSize: 70.sp,
              fontWeight: FontWeight.w500,
              color: ColorsConst.darkGrey),
          headlineMedium: TextStyle(
              fontSize: 50.sp,
              fontWeight: FontWeight.w500,
              color: ColorsConst.darkGrey),
          titleLarge: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w500,
              color: ColorsConst.darkGrey),
          titleMedium: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              color: ColorsConst.darkGrey),
          bodyLarge: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: ColorsConst.darkGrey),
          bodyMedium: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: ColorsConst.darkGrey),
          bodySmall: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: ColorsConst.darkGrey),
          displaySmall: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: ColorsConst.darkGrey)),
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
