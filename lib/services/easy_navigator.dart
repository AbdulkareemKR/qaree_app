import 'dart:developer';

import 'package:Qaree/utils/status_logger/status_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EasyNavigator {
  static Future<T?> openPage<T>({
    required BuildContext context,
    required Widget page,
    bool isAnimated = false,
    bool isPushReplaced = false,
    bool isPushAndRemoveUntil = false,
    bool isDismissible = true,
    bool expand = true,
  }) async {
    if (isPushAndRemoveUntil) {
      return await Navigator.of(context).pushAndRemoveUntil<T>(
          MaterialPageRoute(builder: (context) => page),
          (Route<dynamic> route) => false);
    }

    if (isPushReplaced) {
      return await Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => page));
    }

    if (!isAnimated) {
      return await Navigator.of(context, rootNavigator: true)
          .push<T>(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => page,
      ));
    } else if (isAnimated) {
      return await Navigator.of(context)
          .push<T>(MaterialPageRoute(builder: (context) => page));
    }
    return null;
  }

  /// Pop the view to the root view
  static void popToFirstView(BuildContext context) {
    StatusLogger.debug("Pop to first view");
    Navigator.of(context).popUntil((route) => route.isFirst);
  }

  static Future<void> popPage(context, {args}) async {
    await Navigator.maybePop(context, args);
  }
}
