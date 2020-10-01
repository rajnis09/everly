import 'package:flutter/material.dart';

import './theme_data.dart';

class Themes {
  static ThemeData appTheme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: CustomThemeData.robotoFont.copyWith(
        fontWeight: FontWeight.bold,
        color: CustomThemeData.blackColorShade2,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: CustomThemeData.blueColorShade2,
        ),
      ),
    ),
    cursorColor: CustomThemeData.blueColorShade2,
    textSelectionHandleColor: CustomThemeData.blueColorShade2,
    textSelectionColor: CustomThemeData.blueColorShade2,
    scaffoldBackgroundColor: Colors.white,
    accentColor: CustomThemeData.blueColorShade1,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      iconTheme: IconThemeData(
        color: CustomThemeData.blackColorShade2,
      ),
      actionsIconTheme: IconThemeData(
        color: CustomThemeData.blackColorShade2,
      ),
      textTheme: TextTheme(
        headline6: CustomThemeData.robotoFont.copyWith(
          color: CustomThemeData.blackColorShade1,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: CustomThemeData.blueColorShade1,
    ),
  );
}
