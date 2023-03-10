import 'package:Qaree/constants/colors_const.dart';
import 'package:Qaree/features/splash_screen/controllers/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:Qaree/services/initializer.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late SplashScreenController controller;

  @override
  void initState() {
    controller = SplashScreenController(context: context, ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
            future: Initializer.initAll(),
            builder: (context, snapshot) {
              controller.checkInitialization(snapshot: snapshot);
              return Container(
                color: ColorsConst.primaryBlack,
                child: Center(
                  child: Image.asset('assets/images/white_logo.png'),
                ),
              );
            }));
  }
}
