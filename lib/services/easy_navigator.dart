import 'package:Qaree/utils/status_logger/status_logger.dart';
import 'package:flutter/material.dart';

class EasyNavigator {
  static Future<T?> openPage<T>({
    required BuildContext context,
    required Widget page,
    bool isPushReplaced = false,
    bool isPushAndRemoveUntil = false,
    bool isDismissible = true,
    bool expand = true,
    bool isBottomSheet = false,
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

    if (isBottomSheet) {
      return await Navigator.of(context, rootNavigator: true)
          .push<T>(MaterialPageRoute(
        fullscreenDialog: true,
        builder: (BuildContext context) => page,
      ));
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => page,
        ),
      );
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
