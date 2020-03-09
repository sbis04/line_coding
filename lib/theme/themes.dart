// Copyright (c) 2020 Souvik Biswas

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

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
