import 'package:flutter/material.dart';

final lightTheme = _buildLightTheme();
final darkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  const Color primaryColor = Colors.blueAccent;
  const Color secondaryColor = Colors.blue;
  final ColorScheme colorScheme = const ColorScheme.light()
      .copyWith(primary: primaryColor, secondary: secondaryColor);
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.dark,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: const Color(0xFF0050a0),
    splashFactory: InkRipple.splashFactory,
    accentColor: secondaryColor,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    errorColor: Colors.red,
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base.copyWith(
    textTheme: base.textTheme,
    primaryTextTheme: base.primaryTextTheme,
    accentTextTheme: base.accentTextTheme,
  );
}

// Testing
ThemeData _buildDarkTheme() {
  const Color primaryColor = Colors.blueAccent;
  const Color secondaryColor = Colors.blue;
  final ColorScheme colorScheme = const ColorScheme.light()
      .copyWith(primary: primaryColor, secondary: secondaryColor);
  final ThemeData base = ThemeData(
    brightness: Brightness.dark,
    accentColorBrightness: Brightness.dark,
    colorScheme: colorScheme,
    primaryColor: primaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: const Color(0xFF0050a0),
    splashFactory: InkRipple.splashFactory,
    accentColor: secondaryColor,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    errorColor: Colors.red,
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base.copyWith(
    textTheme: base.textTheme,
    primaryTextTheme: base.primaryTextTheme,
    accentTextTheme: base.accentTextTheme,
  );
}
