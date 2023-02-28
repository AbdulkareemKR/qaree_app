import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static void showCustomSnackBar(
      {required BuildContext context,
      Color? color = ColorsConst.negativeRed,
      required String message}) {
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Center(
        child: Text(
          message,
          style: context.textThemes.bodyText2?.copyWith(
            color: ColorsConst.white,
          ),
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
