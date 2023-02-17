import 'dart:developer';

import 'package:Qaree/utils/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class ThemeManager extends StateNotifier<ThemeData> {
  ThemeManager(ThemeData state) : super(state);

  static final StateNotifierProvider<ThemeManager, ThemeData> themeProvider =
      StateNotifierProvider((ref) => ThemeManager(currentThemeData));

  // Default theme
  static ThemeData currentThemeData = MainTheme.main;

  /// Change the current app theme to the passed [ThemeData]
  void changeTheme(ThemeData theme) {
    currentThemeData = theme;

    state = currentThemeData;

    log('Theme is changed');
  }
}
