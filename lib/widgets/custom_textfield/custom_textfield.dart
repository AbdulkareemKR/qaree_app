import 'package:Naqaa/constants/colors_const.dart';
import 'package:Naqaa/utils/theme/extensions.dart';
import 'package:Naqaa/widgets/custom_textfield/controller.dart';
import 'package:Naqaa/widgets/custom_textfield/textfield_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.type,
    this.textFieldStyle =
        const TextStyle(color: Colors.black, fontWeight: FontWeight.w200),
    required this.controller,
    this.onChange,
    this.onSubmit,
    this.placeHolderText,
    this.isPassword = false,
    this.icon,
    this.width = 50,
    this.validator,
    this.label = '',
    this.indicateValid = false,
    this.showIconLeading = false,
    this.height = 4,
    this.isEnabled = true,
    this.inputFormatter,
    this.hasCounter = false,
    this.counterText = "",
    this.initialValue,
    this.textLanguage = "en",
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final bool indicateValid;
  final TextFieldType type;
  final TextEditingController controller;
  final String? placeHolderText;
  final void Function(String?)? onSubmit;
  final void Function(String?)? onChange;

  /// A function that will return an error [String] or [null] when there is no error
  final String? Function(String)? validator;
  final double width;
  final double height;
  final IconData? icon;
  final bool isPassword;
  final String label;
  final bool showIconLeading;
  final bool isEnabled;
  final bool hasCounter;
  final String counterText;
  final String? initialValue;
  final TextStyle textFieldStyle;
  final String textLanguage;
  final TextInputType keyboardType;

  final List<TextInputFormatter>? inputFormatter;

  @override
  State<CustomTextField> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  late TextFieldType type;

  final FocusNode _focusNode = FocusNode();
  String? errorMessage;
  bool showValid = false;
  final CustomTextFieldWidgetController _widgetController =
      CustomTextFieldWidgetController();

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          type = TextFieldType.active;
        });
      } else {
        _handleValidation();
        setState(() {
          type = TextFieldType.normal;
        });
      }
    });
    type = widget.type;
    if (widget.initialValue != null) {
      widget.controller.text = widget.initialValue!;
    }
    super.initState();
  }

  bool get isValid => errorMessage == null;

  void _handleValidation() {
    if (widget.validator is Function) {
      setState(() {
        errorMessage = widget.validator!(widget.controller.text);
        showValid = widget.indicateValid && widget.controller.text.isNotEmpty;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != ''
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  widget.label,
                  style: context.textThemes.bodyMedium?.regular,
                ),
              )
            : const SizedBox.shrink(),
        SizedBox(
          height: widget.label != '' ? 8 : 0,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
          decoration: BoxDecoration(
            color: widget.isEnabled
                ? ColorsConst.disableGrey
                : ColorsConst.disableGrey,
            borderRadius: BorderRadius.all(Radius.circular(10.sp)),
            border: type == TextFieldType.active
                ? Border.all(
                    color: ColorsConst.black,
                  )
                : Border.all(
                    color: ColorsConst.disableGrey,
                  ),
          ),
          width: widget.width,
          child: Row(
            children: [
              widget.showIconLeading
                  ? Icon(
                      widget.icon,
                      color: _widgetController.getTextFieldColor(
                          type, isValid, showValid),
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                width: widget.width - (widget.icon != null ? 100 : 70),
                height: widget.height,
                child: TextField(
                  inputFormatters: widget.inputFormatter,
                  enabled: widget.isEnabled,
                  obscureText: widget.isPassword,
                  enableSuggestions: false,
                  autocorrect: false,
                  style: context.textThemes.bodySmall?.regular,
                  focusNode: _focusNode,
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  onChanged: widget.onChange,
                  onSubmitted: widget.onSubmit,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: widget.placeHolderText,
                      hintStyle: context.textThemes.bodySmall?.regular
                          .copyWith(color: ColorsConst.lightGrey)),
                  buildCounter: widget.hasCounter
                      ? (_,
                              {required currentLength,
                              maxLength,
                              required isFocused}) =>
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                bottom: widget.height - 5,
                                left: widget.textLanguage == "ar"
                                    ? -15
                                    : widget.width - 110,
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${widget.counterText} " +
                                          (maxLength! - currentLength)
                                              .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: ColorsConst.lightGrey,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    )),
                              ),
                            ],
                          )
                      : null,
                  maxLines: widget.hasCounter ? 5 : 1,
                  minLines: widget.hasCounter ? 5 : 1,
                  maxLength: widget.hasCounter ? 400 : null,
                ),
              ),
              const Spacer(),
              !widget.showIconLeading
                  ? Icon(
                      widget.icon,
                      color: _widgetController.getTextFieldColor(
                          type, isValid, showValid),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        errorMessage != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  errorMessage ?? '',
                  style: const TextStyle(
                      color: ColorsConst.negativeRed, fontSize: 15),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
