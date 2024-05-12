import 'package:flutter/material.dart';

final ThemeData themes = ThemeData(
  textTheme: const TextTheme(
    headline1: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w800,),
    headline2: TextStyle(color: Color.fromARGB(255, 0, 111, 18), fontSize: 11, fontWeight: FontWeight.w500,),
    headline3: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500,),
    bodyText1: TextStyle(color: Color.fromARGB(255, 103, 239, 108), fontSize: 15, fontWeight: FontWeight.w700,),
    bodyText2: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700,)
  ),
  timePickerTheme: TimePickerThemeData(
    dayPeriodColor: Colors.red,
    dayPeriodTextColor: Colors.blue,
    dialHandColor: Colors.green,
    dialTextColor: Colors.grey,
    entryModeIconColor: Colors.purple,
    hourMinuteTextColor: Colors.pink,
    hourMinuteColor: Colors.orange,
  ),
  // timePickerTheme: TimePickerThemeData(
  //   cancelButtonStyle: ButtonStyle(
  //     backgroundColor: MaterialStateProperty.all(Colors.white),
  //     foregroundColor: MaterialStateProperty.all(Color.fromARGB(255, 103, 239, 108)),
  //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10),
  //       side: BorderSide(color: Color.fromARGB(255, 103, 239, 108)),
  //     )),
  //   ),
  //   confirmButtonStyle: ButtonStyle(
  //     backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 103, 239, 108)),
  //     foregroundColor: MaterialStateProperty.all(Colors.white),
  //     shape: MaterialStateProperty.all(RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10),
  //       side: BorderSide(color: Color.fromARGB(255, 103, 239, 108)),
  //     )),
  //   ),
  //   hourMinuteTextStyle: const TextStyle(
  //     color: Colors.black,
  //     fontSize: 20,
  //     fontWeight: FontWeight.w700,
  //   ),
  //   helpTextStyle: const TextStyle(
  //     color: Color.fromARGB(255, 0, 111, 18),
  //     fontSize: 25,
  //     fontWeight: FontWeight.w800,
  //   ),
  // ),
  navigationBarTheme: NavigationBarThemeData(
    indicatorColor: Colors.transparent,
    labelTextStyle: MaterialStateProperty.all(const TextStyle(
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
    background: Colors.white,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
  useMaterial3: true,
  fontFamily: 'Poppins',
);
