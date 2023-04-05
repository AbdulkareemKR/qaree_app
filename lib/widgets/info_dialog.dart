import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/widgets/custom_button/custom_button.dart';
import 'package:Qaree/widgets/custom_button/enums/button_size.dart';
import 'package:Qaree/widgets/custom_button/enums/button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Qaree/utils/theme/extensions.dart';

enum DialogStyle {
  success,
  error,
}

class InfoDialog {
  /// It shows a dialog with a Lottie animation and a message
  /// @param {BuildContext} [context] - The context of the screen where the dialog is to be shown.
  /// @param {DialogStyle} [style] - The style of the dialog.
  /// @param {String} [message] - The message to be displayed in the dialog.
  /// @returns A Future<void>
  static Future<T?> show<T>(
      {required BuildContext context,
      required DialogStyle style,
      required String message}) async {
    switch (style) {
      case DialogStyle.success:
        // add some widgets
        break;
      case DialogStyle.error:
        // add some widgets
        break;

      default:
        throw Exception("Unsupported style: ${style.name}}");
    }

    return showCustomDialog<T>(
      context,
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: context.textThemes.bodySmall,
          ),
        ],
      ),
    );
  }

  static Future<T?> showCustomDialog<T>(
      BuildContext context, Widget content) async {
    return await showGeneralDialog<T>(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 200),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return Center(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.close),
                    ),
                    Align(child: content, alignment: Alignment.center),
                  ],
                ),
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                margin: EdgeInsets.symmetric(horizontal: 12.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.sp),
                ),
              ),
            ],
          ),
        );
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(0, 1), end: const Offset(0, 0))
              .animate(anim1),
          child: child,
        );
      },
    );
  }

  static Future<bool?> showConfirmationDialog({
    required BuildContext context,
    required String title,
    required String message,
    String confirmText = 'ok',
    String cancelText = 'cancel',
  }) {
    return showCustomDialog<bool>(
        context,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w),
          child: Column(
            children: [
              Text(
                title,
                style: context.textThemes.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              SpacingConst.vSpacing16,
              Text(
                message,
                style: context.textThemes.bodyMedium?.regular,
                textAlign: TextAlign.center,
              ),
              SpacingConst.vSpacing20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    label: confirmText,
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    size: ButtonSize.small,
                  ),
                  CustomButton(
                    label: cancelText,
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    style: CustomButtonStyle.secondary,
                    size: ButtonSize.small,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
