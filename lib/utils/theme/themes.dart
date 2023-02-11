import 'package:Naqaa/constants/colors_const.dart';
import 'package:Naqaa/constants/fonts_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainTheme {
  static final main = ThemeData(
      fontFamily: FontConst.fontFamily,
      scaffoldBackgroundColor: ColorsConst.white,
      primaryColor: ColorsConst.cosmicCobalt.shade500,
      dividerColor: Colors.transparent,
      colorScheme: ColorScheme.light(
        primary: ColorsConst.cosmicCobalt.shade500,
        secondary: ColorsConst.white,
      ),
      textTheme: TextTheme(
          headlineLarge: TextStyle(
              fontSize: 70.sp,
              fontWeight: FontWeight.w500,
              color: ColorsConst.dartGrey),
          headlineMedium: TextStyle(
              fontSize: 50.sp,
              fontWeight: FontWeight.w500,
              color: ColorsConst.dartGrey),
          titleLarge: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w500,
              color: ColorsConst.dartGrey),
          titleMedium: TextStyle(
              fontSize: 25.sp,
              fontWeight: FontWeight.w500,
              color: ColorsConst.dartGrey),
          bodyLarge: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
              color: ColorsConst.dartGrey),
          bodyMedium: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: ColorsConst.dartGrey),
          bodySmall: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: ColorsConst.dartGrey),
          displaySmall: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: ColorsConst.dartGrey)),
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
