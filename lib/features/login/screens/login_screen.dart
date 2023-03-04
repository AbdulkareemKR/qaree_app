import 'package:Qaree/constants/border_radius_const.dart';
import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/constants/spacing_const.dart';
import 'package:Qaree/features/login/controllers/login_screen_controller.dart';
import 'package:Qaree/utils/theme/extensions.dart';
import 'package:Qaree/widgets/bounce.dart';
import 'package:Qaree/widgets/custom_button/custom_button.dart';
import 'package:Qaree/widgets/custom_button/enums/button_style.dart';
import 'package:Qaree/widgets/custom_textfield/custom_textfield.dart';
import 'package:Qaree/widgets/custom_textfield/textfield_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
                    borderRadius: BorderRadiusConst.circularBorderRadius,
                  ),
                  width: 230.w,
                  child:
                      Image(image: AssetImage("assets/images/white_logo.png")),
                ),
                SpacingConst.vSpacing80,
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
                  isPassword: true,
                  icon: Icons.lock_outline_rounded,
                ),
                SpacingConst.vSpacing40,
                CustomButton(
                  label: "Login",
                  onPressed: _controller.onLoginPressed,
                  style: CustomButtonStyle.primary,
                  textStyle: context.textThemes.bodyMedium?.copyWith(
                    color: ColorsConst.white,
                  ),
                ),
                SpacingConst.vSpacing20,
                Bounce(
                  onTap: _controller.onSignUpPressed,
                  child: RichText(
                    text: TextSpan(
                      style: context.textThemes.bodyMedium?.copyWith(
                        color: ColorsConst.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Don't have an account? ",
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: ColorsConst.primaryPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
