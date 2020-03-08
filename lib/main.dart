import 'package:flutter/material.dart';
import 'package:line_coding/theme/themes.dart';

import 'line_coding.dart';
import 'theme/custom_theme.dart';

void main() => runApp(
      CustomTheme(
        initialThemeKey: MyThemeKeys.LIGHT,
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Line Coding',
      theme: CustomTheme.of(context),
      // ThemeData(
      //   primarySwatch: Colors.orange,
      // ),
      home: LineCoding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
