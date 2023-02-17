import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/widgets/custom_textfield/textfield_types.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidgetController {
  Color getTextFieldColor(TextFieldType type, bool isValid, bool showValid) {
    if (type == TextFieldType.active) {
      return ColorsConst.primaryPurple;
    } else if (isValid) {
      if (showValid) {
        return ColorsConst.positiveGreen;
      } else {
        return ColorsConst.grey;
      }
    } else {
      return ColorsConst.grey;
    }
  }
}
