import 'package:Naqaa/features/login/screens/login_screen.dart';
import 'package:Naqaa/services/initializer.dart';
import 'package:Naqaa/utils/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await Initializer.initAll();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ProviderScope(
            child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Qaree App',
          theme: MainTheme.main,
          home: child,
        ));
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: const LoginScreen(),
      ),
    );
  }
}
