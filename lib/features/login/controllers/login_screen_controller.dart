import 'dart:developer';

import 'package:Naqaa/features/login/domain/auth_reo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// This class is responsible for the login screen logic
/// it will handle the login process and navigate to the home screen
class LoginScreenController {
  BuildContext context;
  WidgetRef ref;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginScreenController({
    required this.context,
    required this.ref,
  });

  /// This method will be called from onLoginPressed method to login the user
  /// It will call the [FirebaseAuthServices] to sign in the user
  Future<void> login() async {
    /**
     * First we check that the user entered a valid email and password
     */
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      // If not throw error that will be handled in the widget
      throw Exception('Please enter email and password');
    }
    final user = await ref
        .read(authRepo)
        .singInWithEmail(emailController.text, passwordController.text);
    if (user != null) {
      // If everything went good this means successful login
      log("Successfully logged in with UId: ${user.uid}");
    } else {
      // else throw error that will be handled in the widget
      throw Exception('Invalid email or password');
    }
  }

  /// This function will handle the log in button from the UI
  Future<void> onLoginPressed() async {
    try {
      await login();

      // If everything went good and the user was logged in
      // TODO: make a home page
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Container()));
    } catch (e) {
      // If the user enters invalid email/password, we will show an error dialog
      log(e.toString());
    }
  }
}
