import 'package:flutter/material.dart';

enum MyThemeKeys { LIGHT, DARK }

class MyThemes {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.orange, // AppBar
    backgroundColor: Colors.white, // Background
    highlightColor: Colors.black54, // Axis
    dividerColor: Colors.black12, // Bit Separator
    accentColor: Colors.red, // Line Color
    buttonColor: Colors.orange[800], // Draw button
    textTheme: TextTheme(
      caption: TextStyle(
        color: Colors.black,
        fontSize: 20,
      ),
    ),
    // textTheme: TextTheme(
    //   headline: TextStyle(color: Colors.white), // "Pet Puja" text color
    // ),
    // accentTextTheme: TextTheme(
    //   headline: TextStyle(
    //     color: Color(0xFFf7ffbd), // LOGIN headline text color
    //   ),
    // ),
    brightness: Brightness.light,
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black, // AppBar
    backgroundColor: Colors.teal[700], // Background
    highlightColor: Colors.white54, // Axis
    dividerColor: Colors.white12, // Bit Separator
    accentColor: Colors.white60, // Line Color
    buttonColor: Colors.teal[700], // Draw button
    textTheme: TextTheme(
      caption: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    // textTheme: TextTheme(
    //   headline: TextStyle(color: Colors.white),
    // ),
    // accentTextTheme: TextTheme(
    //   headline: TextStyle(
    //     color: Color(0xFFf7ffbd),
    //   ),
    // ),
    brightness: Brightness.dark,
  );

  static ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    switch (themeKey) {
      case MyThemeKeys.LIGHT:
        return lightTheme;
      case MyThemeKeys.DARK:
        return darkTheme;
      default:
        return lightTheme;
    }
  }
}
