import 'package:Qaree/firebase_options.dart';
import 'package:Qaree/utils/status_logger/extensions.dart';
import 'package:Qaree/utils/status_logger/status_logger.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

class Initializer {
  static Future<bool> initAll() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await initFirebase();

      // For Amplitude Services
      // await initAmplitude();

      await initDateFormatter();

      return true;
    } catch (e) {
      e.logException();
      return false;
    }
  }

  // static Future<void> initAmplitude() async {
  //   try {
  //     await AmplitudeServices.init(Environment.instance.apiKeys?.amplitude ?? '');
  //   } catch (e) {
  //     e.logException();
  //   }
  // }

  static Future<void> initDateFormatter() async {
    try {
      // TODO : use local
      await initializeDateFormatting('ar_SA');
    } catch (e) {
      e.logException();
      StatusLogger.error('Failed to init DateFormatting!');
    }
  }

  static Future<void> initFirebase() async {
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      StatusLogger.info(
          "(Initializer/initFirebase) Firebase project [${Firebase.app().options.projectId}] status: initialized ✅");
    } catch (e) {
      e.logException();
    }
  }
}
