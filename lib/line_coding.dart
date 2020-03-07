import 'package:flutter/material.dart';

import 'painter_area.dart';
import 'retrieve_code.dart';

class LineCoding extends StatefulWidget {
  @override
  _LineCodingState createState() => _LineCodingState();
}

class _LineCodingState extends State<LineCoding> {

  String _codingTechnique = "bipolarNRZ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Line Coding"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RetreiveCode(onTextChange: (String str, bool valid) {
              setState(() {
                textString = str;
                isValid = valid;
              });
            }),
            (textString == "" || isValid == false)
                ? Container()
                : PainterArea(textString, _codingTechnique),
          ],
        ),
      ),
    );
  }
}
