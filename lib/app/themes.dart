import 'package:flutter/material.dart';

final ThemeData themes = ThemeData(
  textTheme: const TextTheme(
    headline1: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800,),
    headline2: TextStyle(color: Color.fromARGB(255, 103, 239, 108), fontSize: 11, fontWeight: FontWeight.w500,),
    headline3: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500,),
    bodyText1: TextStyle(color: Color.fromARGB(255, 103, 239, 108), fontSize: 15, fontWeight: FontWeight.w700,),
    bodyText2: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700,)
  ),

  navigationBarTheme: NavigationBarThemeData(
    indicatorColor: Colors.white.withOpacity(0.1),
    labelTextStyle: MaterialStateProperty.all(
      const TextStyle(
      color: Colors.black,
      fontSize: 11,
      fontWeight: FontWeight.w500,
  ),),),
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
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
  useMaterial3: true,
  fontFamily: 'Poppins',
);
