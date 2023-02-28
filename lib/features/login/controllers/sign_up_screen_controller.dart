import 'dart:developer';
import 'package:Qaree/features/home/screens/home_screen.dart';
import 'package:Qaree/features/login/auth_reo.dart';
import 'package:Qaree/features/login/screens/login_screen.dart';
import 'package:Qaree/repos/reader_repo.dart';
import 'package:Qaree/services/easy_navigator.dart';
import 'package:Qaree/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This class is responsible for the login screen logic
/// it will handle the login process and navigate to the home screen
class SignUpScreenController {
  BuildContext context;
  WidgetRef ref;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  SignUpScreenController({
    required this.context,
    required this.ref,
  });

  /// This method will be called from onLoginPressed method to login the user
  /// It will call the [FirebaseAuthServices] to sign up the user
  Future<void> signUp() async {
    try {
      /**
     * First we check that the user entered a valid email and password
     */
      if (emailController.text.isEmpty ||
          passwordController.text.isEmpty ||
          nameController.text.isEmpty) {
        // If not throw error that will be handled in the widget
        CustomSnackBar.showCustomSnackBar(
            context: context, message: "Please fill all fields");
        throw Exception('Please fill all fields');
      }
      final user = await ref
          .read(authRepo)
          .createUserWithEmail(emailController.text, passwordController.text);
      if (user != null) {
        final reader = await ReaderRepo.createReader(
            id: user.uid,
            name: nameController.text,
            email: emailController.text);

        // If reader is null then there was an error creating the user
        if (reader == null) {
          CustomSnackBar.showCustomSnackBar(
              context: context, message: "Error creating user");
          throw Exception('Error creating user');
        }

        // If everything went good this means successful login
        log("Successfully Signed up with UId: ${user.uid}");
      } else {
        // else throw error that will be handled in the widget
        throw Exception('Invalid email or password');
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  /// This function will handle the Sign Up button from the UI
  Future<void> onSignUpPressed() async {
    try {
      await signUp();

      // If everything went good and the user was logged in
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()));
    } catch (e) {
      // If the user enters invalid email/password, we will show an error dialog
      log(e.toString());
      CustomSnackBar.showCustomSnackBar(
          context: context, message: "Invalid email or password");
    }
  }

  /// This function will handle the login button from the UI
  void onLoginPressed() {
    EasyNavigator.openPage(context: context, page: LoginScreen());
  }
}
