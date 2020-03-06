import 'package:flutter/material.dart';

import 'line_coding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Line Coding',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LineCoding(),
      debugShowCheckedModeBanner: false,
    );
  }
}
