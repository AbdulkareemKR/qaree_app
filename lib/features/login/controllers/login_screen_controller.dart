import 'dart:developer';
import 'package:Qaree/features/login/auth_reo.dart';
import 'package:Qaree/features/login/screens/sign_up_screen.dart';
import 'package:Qaree/features/navigation_bar/screens/navigation_bar.dart';
import 'package:Qaree/services/easy_navigator.dart';
import 'package:Qaree/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This class is responsible for the login screen logic
/// it will handle the login process and navigate to the home screen
class LoginScreenController {
  BuildContext context;
  WidgetRef ref;

  LoginScreenController({
    required this.context,
    required this.ref,
  });

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /// This method will be called from onLoginPressed method to login the user
  /// It will call the [FirebaseAuthServices] to sign in the user
  Future<void> login() async {
    try {
      /**
     * First we check that the user entered a valid email and password
     */
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        // If not throw error that will be handled in the widget
        CustomSnackBar.showCustomSnackBar(
            context: context, message: "Email or password is empty");
        throw Exception('Email or password is empty');
      }
      final user = await ref
          .read(authRepo)
          .singInWithEmail(emailController.text, passwordController.text);
      if (user != null) {
        // If everything went good this means successful login
        log("Successfully logged in with UId: ${user.uid}");
      } else {
        // else throw error that will be handled in the widget
        CustomSnackBar.showCustomSnackBar(
            context: context, message: "Invalid email or password");
        // throw Exception('Invalid email or password');
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  /// This function will handle the log in button from the UI
  Future<void> onLoginPressed() async {
    try {
      await login();

      // If everything went good and the user was logged in
      EasyNavigator.openPage(
          context: context, page: MainNavigationBar(), isPushReplaced: true);
    } catch (e) {
      // If the user enters invalid email/password, we will show an error dialog
      log(e.toString());
      CustomSnackBar.showCustomSnackBar(
          context: context, message: "Invalid email or password");
    }
  }

  /// This function will handle the sign up button from the UI
  void onSignUpPressed() {
    EasyNavigator.openPage(context: context, page: SignUpScreen());
  }
}
