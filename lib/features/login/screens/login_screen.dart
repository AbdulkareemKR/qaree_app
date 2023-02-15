import 'package:Naqaa/constants/border_radius_const.dart';
import 'package:Naqaa/constants/colors_const.dart';
import 'package:Naqaa/constants/spacing_const.dart';
import 'package:Naqaa/features/login/controllers/login_screen_controller.dart';
import 'package:Naqaa/utils/theme/extensions.dart';
import 'package:Naqaa/widgets/bounce.dart';
import 'package:Naqaa/widgets/custom_button/custom_button.dart';
import 'package:Naqaa/widgets/custom_button/enums/button_style.dart';
import 'package:Naqaa/widgets/custom_textfield/custom_textfield.dart';
import 'package:Naqaa/widgets/custom_textfield/textfield_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final LoginScreenController _controller;

  @override
  void didChangeDependencies() {
    _controller = LoginScreenController(context: context, ref: ref);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: ColorsConst.primaryBlack,
        child: SafeArea(
          child: Column(
            children: [
              SpacingConst.vSpacing60,
              Text(
                "Qaree",
                style: context.textThemes.displayMedium?.copyWith(
                  fontFamily: "JosefinSans",
                  color: ColorsConst.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SpacingConst.vSpacing60,
              Container(
                padding: EdgeInsets.all(18.h),
                decoration: BoxDecoration(
                  color: ColorsConst.primaryPurple,
                  borderRadius: BorderRadiusConst.circularBorderRadius,
                ),
                height: 114.h,
                width: 114.h,
                child: SvgPicture.asset("assets/svg/logo.svg"),
              ),
              SpacingConst.vSpacing100,
              CustomTextField(
                type: TextFieldType.normal,
                controller: _controller.emailController,
                width: 350.w,
                height: 50.h,
                placeHolderText: 'Email',
                icon: Icons.email,
              ),
              SpacingConst.vSpacing20,
              CustomTextField(
                type: TextFieldType.normal,
                controller: _controller.passwordController,
                width: 350.w,
                height: 50.h,
                placeHolderText: 'Password',
                icon: Icons.lock_outline_rounded,
              ),
              SpacingConst.vSpacing40,
              CustomButton(
                label: "Sign In",
                onPressed: () => {},
                style: CustomButtonStyle.primary,
                textStyle: context.textThemes.bodyMedium?.copyWith(
                  color: ColorsConst.white,
                ),
              ),
              SpacingConst.vSpacing20,
              Bounce(
                onTap: () {},
                child: Text(
                  "Sign Up",
                  style: context.textThemes.bodyMedium?.copyWith(
                    color: ColorsConst.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
