import 'package:Qaree/constants/colors_const.dart';
import 'package:flutter/material.dart';
import 'package:Qaree/utils/theme/extensions.dart';

AppBar CustomAppBar(
    {required BuildContext context, String? title, Color? backgroundColor}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: backgroundColor ?? ColorsConst.lightGrey,
    title: Center(
      child: Text(
        title ?? "",
        style: context.textThemes.displayMedium?.copyWith(
          fontFamily: "JosefinSans",
          color: ColorsConst.primaryBlack,
        ),
      ),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
    ),
  );
}
