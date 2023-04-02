import 'package:Qaree/features/book_search/screens/book_search_screen.dart';
import 'package:Qaree/features/login/screens/login_screen.dart';
import 'package:Qaree/features/splash_screen/views/splash_screen.dart';
import 'package:Qaree/firebase_options.dart';
import 'package:Qaree/utils/theme/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/login/screens/login_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
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
      child: SplashScreen(),
    );
  }
}
