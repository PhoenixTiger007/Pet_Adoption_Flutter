import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'PrefData.dart';

Color borderColor = '#E7E4EF'.toColor();
Color primaryColor = '#7A6DB7'.toColor();
Color alphaColor = '#F9F8FF'.toColor();
// Color primaryColor = "#7F3C8A".toColor();
Color lightCellColor = '#EBEFF5'.toColor();

Color darkBackgroundColor = '#14181E'.toColor();
Color darkCellColor = '#2B2B2B'.toColor();
Color themePrimaryColor = '#E4E6ED'.toColor();
Color themeBackgroundColor = '#7F3C8A'.toColor();
Color themeCellColor = '#7F3C8A'.toColor();
Color textColor = Colors.black87;
Color subTextColor = '#746F7A'.toColor();
Color backgroundColor = Colors.grey.shade500;
Color cellColor = '#F9F9FC'.toColor();
// Color cellColor = "#E2E7F1".toColor();
Color accentColor = '#7F3C8A'.toColor();
Color iconColor = '#7F3C8A'.toColor();
Color defBgColor = '#F4F4F4'.toColor();
String fontFamily = 'SansSerif';
String customFontFamily = 'Gilroy';
String assetsPath = 'assets/images/';

const double avatarRadius = 40;
const double padding = 20;

setThemePosition({BuildContext? context}) async {
  bool isNightMode = await PrefData.getNightTheme();

  if (context != null) {
    ThemeData themeData = Theme.of(context);

    primaryColor = themeData.primaryColor;
    backgroundColor = themeData.dialogBackgroundColor;
    accentColor = themeData.primaryColor;
  }

  if (isNightMode) {
    textColor = Colors.white;
    subTextColor = Colors.white70;
    iconColor = Colors.grey.shade500;
    defBgColor =Colors.black87;

  } else {
    textColor = Colors.black;
    subTextColor = '#79757F'.toColor();
    iconColor = '#C4CDDE'.toColor();
    defBgColor = '#F4F4F4'.toColor();
  }
}

extension ColorExtension on String {
  toColor() {
    var hexColor = replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    if (hexColor.length == 8) {
      return Color(int.parse('0x$hexColor'));
    }
  }
}

void exitApp() {
  if (Platform.isIOS) {
    exit(0);
  } else {
    SystemNavigator.pop();
  }
}