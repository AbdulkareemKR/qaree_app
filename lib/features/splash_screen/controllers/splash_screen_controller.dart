import 'package:Qaree/features/login/screens/login_screen.dart';
import 'package:Qaree/features/navigation_bar/screens/navigation_bar.dart';
import 'package:Qaree/providers/reader_provider.dart';
import 'package:Qaree/services/easy_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Qaree/utils/status_logger/status_logger.dart';

class SplashScreenController {
  BuildContext context;
  WidgetRef ref;

  SplashScreenController({
    required this.context,
    required this.ref,
  });

  void _navigateToHome() async {
    EasyNavigator.openPage(
      context: context,
      page: ref.read(userProvider) == null
          ? const LoginScreen()
          : const MainNavigationBar(),
      isPushReplaced: true,
    );
  }

  /// This method checks if the [Initializer] is done, if so then it navigate to [HomePage]
  void checkInitialization({required AsyncSnapshot<Object?> snapshot}) {
    switch (snapshot.connectionState) {
      case ConnectionState.done:
        Future.microtask(() => _navigateToHome());
        break;

      default:
        StatusLogger.info('snapshot type: ${snapshot.connectionState}');
    }
  }
}
