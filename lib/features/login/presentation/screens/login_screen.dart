import 'package:Naqaa/constants/spacing_const.dart';
import 'package:Naqaa/features/login/presentation/controllers/login_screen_controller.dart';
import 'package:Naqaa/utils/theme/extensions.dart';
import 'package:Naqaa/widgets/custom_button/custom_button.dart';
import 'package:Naqaa/widgets/custom_textfield/custom_textfield.dart';
import 'package:Naqaa/widgets/custom_textfield/textfield_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("login.loginToServeYou", style: context.textThemes.bodyMedium),
        SpacingConst.vSpacing20,
        CustomTextField(
          label: "email",
          type: TextFieldType.normal,
          controller: _controller.emailController,
          width: 300.w,
          height: 50.h,
          placeHolderText: "example@Garage.com",
        ),
        SpacingConst.vSpacing16,
        CustomTextField(
          isPassword: true,
          label: "password",
          type: TextFieldType.normal,
          controller: _controller.passwordController,
          width: 300.w,
          height: 50.h,
          placeHolderText: "*********",
        ),
        CustomButton(
          width: 317.w,
          height: 50.h,
          onPressed: _controller.onLoginPressed,
          label: 'loginButton',
        ),
      ],
    );
  }
}
