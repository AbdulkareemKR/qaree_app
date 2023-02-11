import 'package:Naqaa/widgets/custom_textfield/textfield_types.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidgetController {
  Color getTextFieldColor(TextFieldType type, bool isValid, bool showValid) {
    if (type == TextFieldType.active) {
      return Colors.purple;
    } else if (isValid) {
      if (showValid) {
        return Colors.green;
      } else {
        return Colors.grey;
      }
    } else {
      return Colors.red;
    }
  }
}
