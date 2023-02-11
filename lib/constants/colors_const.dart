import 'package:flutter/material.dart';

///
/// This class should contains all the colors that will be used
/// in the app. If the colors is not here, add it.
class ColorsConst {
  static const MaterialColor cosmicCobalt = MaterialColor(
    _cosmicCobaltValue,
    <int, Color>{
      /// cosmicCobalt20
      100: Color(0xffD6D4E6),

      200: Color(0xff837DB4),

      /// cosmicCobalt60
      300: Color(0xff837DB4),

      /// cosmicCobalt80
      400: Color(0xff5A529B),

      /// cosmicCobalt100
      500: Color(_cosmicCobaltValue),
    },
  );
  static const int _cosmicCobaltValue = 0xff312782;

  static const MaterialColor pictonBlue = MaterialColor(
    _pictonBlueValue,
    <int, Color>{
      /// pictonBlue20
      100: Color(0xffAEDCF3),

      /// pictonBlue60
      300: Color(0xff86CBEC),

      /// pictonBlue80
      400: Color(0xff5DB9E6),

      /// pictonBlue100
      500: Color(_pictonBlueValue),
    },
  );
  static const int _pictonBlueValue = 0xff35A8E0;

  static const white = Colors.white;
  static const black = Colors.black;
  static const transparent = Colors.transparent;
  static const cultured = Color(0xffFAFAFA);

  static const profilePictureGrey = Color(0xffF6F6F6);
  static const dartGrey = Color(0xff1F262D);
  static const blackCoral = Color(0xff555F68);
  static const lightGrey = Color(0xff9CA7B1);
  static const disableGrey = Color(0xffE2E7EC);
  static const lightGreyBackground = Color(0xffe4e1e9);
  static const gunmetalLight = Color(0xff656565);

  static const negativeRed = Color(0xffEB5757);
  static const positiveGreen = Color(0xff40c97b);
  static const warningYellow = Color(0xffF2C94C);
  static const infoBlue = Color(0xff4C71F2);
  static const primaryGreen = Color(0xff57B95F);
  static const gradientGreenOne = Color(0xff48D34C);
  static const gradientGreenTwo = Color(0xff45C249);
  static const redOne = Color(0xffCD5656);
  static const gradientRedOne = Color(0xffD74949);
  static const gradientRedTwo = Color(0xffB61414);
  static const gradientYellowOne = Color(0xffE9C909);
  static const gradientYellowTwo = Color(0xffDE9C0A);
  static const gradientBlue = Color(0xff5D5FEF);
  static const primaryBlue = Color(0xff2042A3);
  static const greenTitle = Color(0xff60BC63);
  static const gradientPinkOne = Color(0xffD57DFF);
  static const gradientPinkTwo = Color(0xffA645B6);
  static const googleMapBlue = Color(0xff02B1FD);
}
