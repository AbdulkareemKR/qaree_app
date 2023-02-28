import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:Qaree/widgets/conditionary_widget.dart';
import 'package:Qaree/widgets/custom_button/enums/button_size.dart';
import 'package:Qaree/widgets/custom_button/enums/button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    this.label,
    // ignore: avoid_init_to_null
    this.icon = null,
    required this.onPressed,
    this.style,
    this.size,
    this.width,
    this.child,
    this.height,
    this.color,
    this.textColor = ColorsConst.white,
    this.textStyle,
  })  

  ///
  /// You should pass either [style] or [color], and [size] or [width] and [height].
  /// since style will give you the pre-defined styles as in figma, and [size]
  /// will give the pre-defined sizes as in figma.
  ///
  : assert(!(style != null && color != null) &&
            !(size != null && (width != null || height != null))),
        super(key: key);

  final String? label;
  final IconData? icon;
  final CustomButtonStyle? style;
  final ButtonSize? size;
  final double? width;
  final double? height;
  final Color? color;
  final Widget? child;
  final Function() onPressed;
  final Color? textColor;
  final TextStyle? textStyle;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  late Color _color;
  late Color _hoverColor;
  late Color _iconColor;
  late double _width;
  late double _height;
  late Border _border;
  late Color _iconBackgroundColor;
  late bool _showIcon;
  late bool _showLabel;
  late Color _textColor;
  bool _isHovered = false;
  bool isLoading = false;

  @override
  void didChangeDependencies() {
    ///
    /// Getting the button colors && border.
    ///
    if (widget.style != null) {
      _textColor = _getTextColorFromStyle();
      _color = _getColorFromStyle();
      _border = _getBorderFromStyle();
      _hoverColor = _getHoverColorFromStyle();
    } else {
      _color = widget.color ?? ColorsConst.black;
      _hoverColor = ColorsConst.black;
      _textColor = ColorsConst.white;
      _border = Border.all(style: BorderStyle.none);
    }

    ///
    /// Getting the button size.
    ///
    if (widget.size != null) {
      final size = _getButtonSize();
      _width = size.width;
      _height = size.height;
      _iconBackgroundColor = _getIconBackgrounColor();
      _iconColor = _getIconColor();

      /// The icon is not shown in the small size only.
      _showIcon = widget.size != ButtonSize.small && widget.icon != null;

      /// The label is not shown in the micro only.
      _showLabel = widget.size != ButtonSize.micro;
    } else {
      _showIcon = widget.icon != null;
      _showLabel = true;
      _width = widget.width ?? 319.w;
      _height = widget.height ?? 50.h;
      _iconBackgroundColor = ColorsConst.white;
      _iconColor = ColorsConst.black;
    }
    super.didChangeDependencies();
  }

  Color _getColorFromStyle() {
    switch (widget.style) {
      case CustomButtonStyle.primary:
        return ColorsConst.primaryPurple;
      case CustomButtonStyle.secondary:
        return ColorsConst.primaryPurple.withOpacity(0.15);
      case CustomButtonStyle.thirdly:
        return ColorsConst.lightGrey;
      case CustomButtonStyle.disabled:
        return ColorsConst.disableGrey;
      default:
        return ColorsConst.black;
    }
  }

  Color _getHoverColorFromStyle() {
    switch (widget.style) {
      case CustomButtonStyle.primary:
        return ColorsConst.primaryPurple.withOpacity(0.8);
      case CustomButtonStyle.secondary:
        return ColorsConst.lightGrey.withOpacity(0.15);

      default:
        return ColorsConst.black;
    }
  }

  Color _getIconBackgrounColor() {
    switch (widget.size) {
      case ButtonSize.micro:
        return Colors.transparent;

      default:
        return ColorsConst.white;
    }
  }

  Color _getIconColor() {
    switch (widget.size) {
      case ButtonSize.micro:
        return ColorsConst.white;

      default:
        return ColorsConst.black;
    }
  }

  Color _getTextColorFromStyle() {
    switch (widget.style) {
      case CustomButtonStyle.primary:
        return ColorsConst.white;
      case CustomButtonStyle.secondary:
        return ColorsConst.black;
      case CustomButtonStyle.thirdly:
        return ColorsConst.black;
      case CustomButtonStyle.disabled:
        return ColorsConst.darkGrey;
      default:
        return ColorsConst.white;
    }
  }

  Border _getBorderFromStyle() {
    switch (widget.style) {
      case CustomButtonStyle.thirdly:
        return Border.all(
            color: ColorsConst.black, width: 1, style: BorderStyle.solid);

      default:
        return Border.all(style: BorderStyle.none);
    }
  }

  Size _getButtonSize() {
    switch (widget.size) {
      case ButtonSize.large:
        return Size(317.w, 50.h);
      case ButtonSize.medium:
        return Size(200.w, 50.h);
      case ButtonSize.micro:
        return Size(40.w, 39.h);
      case ButtonSize.small:
        return Size(112.w, 39.h);
      default:
        return Size(317.w, 50.h);
    }
  }

  TextStyle? _getTextStyle() {
    switch (widget.size) {
      case ButtonSize.large:
        return context.textThemes.bodyText2;
      case ButtonSize.medium:
        return context.textThemes.bodyText1;
      case ButtonSize.micro:
        return context.textThemes.bodyText2;
      case ButtonSize.small:
        return context.textThemes.caption;
      default:
        return context.textThemes.bodyText2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() async {
          HapticFeedback.mediumImpact();

          setState(() {
            _isHovered = true;
            _width -= 2;
            _height -= 2;
          });
          Future.delayed(const Duration(milliseconds: 200))
              .then((value) => setState(() {
                    _isHovered = false;
                    _width += 2;
                    _height += 2;
                  }));

          setState(() {
            isLoading = true;
          });

          /// Calling the onPressed
          await widget.onPressed();

          setState(() {
            isLoading = false;
          });
        }),
        onTapDown: (d) {
          setState(() {
            _isHovered = true;
            _width -= 2;
            _height -= 2;
          });
        },
        onTapCancel: () {
          setState(() {
            _isHovered = false;
            _width += 2;
            _height += 2;
          });
        },
        onTapUp: (details) async {
          setState(() {
            _isHovered = false;
            _width += 2;
            _height += 2;
          });
        },
        child: AnimatedContainer(
          curve: Curves.easeInBack,
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: _showLabel && !isLoading ? 9.w : 0,
          ),
          decoration: BoxDecoration(
              color: _isHovered ? _hoverColor : _color,
              border: _border,
              borderRadius: BorderRadius.circular(isLoading ? _height : 14.w)),
          width: isLoading ? _height : _width,
          height: _height,
          child: ConditionaryWidget(
            falseWidget: widget.child,
            condition: widget.label != null,
            trueWidget: Center(
              child: ConditionaryWidget(
                condition: !isLoading,
                trueWidget: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: _showIcon ? _width - 0.05 * _width : null,
                    child: Row(
                        mainAxisAlignment: _showIcon
                            ? MainAxisAlignment.spaceBetween
                            : MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ConditionaryWidget(
                              condition: _showIcon && widget.icon != null,
                              trueWidget: Container(
                                child: Icon(
                                  widget.icon,
                                  color: _iconColor,
                                ),
                                width: 35.w,
                                height: 35.h,
                                decoration: BoxDecoration(
                                    color: _iconBackgroundColor,
                                    borderRadius: BorderRadius.circular(9.w)),
                              )),
                          Center(
                            child: ConditionaryWidget(
                                condition: _showLabel,
                                trueWidget: Text(
                                  widget.label ?? '',
                                  style: widget.textStyle
                                      ?.copyWith(color: _textColor),
                                )),
                          ),
                          ConditionaryWidget(
                              condition: _showLabel && _showIcon,
                              trueWidget: SizedBox(
                                width: 35.h,
                                height: 35.h,
                              )),
                        ]),
                  ),
                ),
                falseWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: _height - 20,
                        height: _height - 20,
                        child: const CircularProgressIndicator(
                          color: ColorsConst.white,
                          strokeWidth: 2,
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }
}
