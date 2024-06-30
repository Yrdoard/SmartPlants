import 'package:flutter/material.dart';

final ThemeData themes = ThemeData(
  textTheme: const TextTheme(
    headlineLarge: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800),
    bodyLarge: TextStyle(color: Color.fromARGB(255, 103, 239, 108), fontSize: 25, fontWeight: FontWeight.w800),
    headlineSmall: TextStyle(color: Color.fromARGB(255, 0, 111, 18), fontSize: 11, fontWeight: FontWeight.w500),
    bodyMedium: TextStyle(color: Color.fromARGB(255, 103, 239, 108), fontSize: 15, fontWeight: FontWeight.w700),
  ),
  navigationBarTheme: NavigationBarThemeData(
    indicatorColor: Colors.transparent,
    labelTextStyle: WidgetStateProperty.all(const TextStyle(
      color: Colors.black,
      fontSize: 11,
      fontWeight: FontWeight.w500,
  ),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Color.fromARGB(255, 103, 239, 108),
    backgroundColor: Colors.white,
  ),
  cardColor: Colors.white,
  brightness: Brightness.light,
  splashColor: Colors.white,
  highlightColor: Colors.white,
  primaryColor: const Color.fromARGB(255, 103, 239, 108),
  bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.white
  ),
  appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.white
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary:  Color.fromARGB(255, 103, 239, 108),
    onPrimary: Colors.black,
    secondary: Colors.white,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
  useMaterial3: true,
  fontFamily: 'Poppins',
);
