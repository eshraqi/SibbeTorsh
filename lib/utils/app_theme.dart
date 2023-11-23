import 'package:flutter/material.dart';
import 'app_color.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    fontFamily: 'yekanback',
    scaffoldBackgroundColor: AppColor.backgroundColor,
    primaryColor: AppColor.colorPrimary,
    primaryColorDark: AppColor.colorPrimary,
    tabBarTheme: const TabBarTheme(
      labelPadding: EdgeInsets.only(),
      labelColor: AppColor.colorPrimary,
      labelStyle: TextStyle(
        color: AppColor.colorPrimary,
        fontFamily: 'yekanback',
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelStyle: TextStyle(
        color: AppColor.grayText,
        fontFamily: 'yekanback',
        fontSize: 12,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelColor: AppColor.grayText,
    ),
    textSelectionTheme: TextSelectionThemeData(
        cursorColor: AppColor.colorPrimary, selectionColor: AppColor.colorPrimary.withAlpha(70), selectionHandleColor: AppColor.colorPrimary), colorScheme: const ColorScheme.light().copyWith(background: AppColor.backgroundColor),
  );
}
