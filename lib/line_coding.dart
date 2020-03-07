import 'package:flutter/material.dart';

import 'painter_area.dart';
import 'retrieve_code.dart';

class LineCoding extends StatefulWidget {
  @override
  _LineCodingState createState() => _LineCodingState();
}

class _LineCodingState extends State<LineCoding> {
  String _codingTechnique = "unipolarNRZ";
  DropdownButton _codingTechniqueSelector() => DropdownButton<String>(
        items: [
          DropdownMenuItem(
            value: "unipolarNRZ",
            child: Text(
              "unipolarNRZ",
              style: TextStyle(fontSize: 15),
            ),
          ),
          DropdownMenuItem(
            value: "unipolarRZ",
            child: Text(
              "unipolarRZ",
              style: TextStyle(fontSize: 15),
            ),
          ),
          DropdownMenuItem(
            value: "polarNRZ",
            child: Text(
              "polarNRZ",
              style: TextStyle(fontSize: 15),
            ),
          ),
          DropdownMenuItem(
            value: "polarRZ",
            child: Text(
              "polarRZ",
              style: TextStyle(fontSize: 15),
            ),
          ),
          DropdownMenuItem(
            value: "bipolarNRZ",
            child: Text(
              "bipolarNRZ",
              style: TextStyle(fontSize: 15),
            ),
          ),
          DropdownMenuItem(
            value: "bipolarRZ",
            child: Text(
              "bipolarRZ",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
        onChanged: (value) {
          setState(() {
            _codingTechnique = value;
          });
        },
        value: _codingTechnique,
        focusColor: Colors.orange,
      );

  // String _codingTechnique = "bipolarRZ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Line Coding"),
        elevation: 0,
        actions: <Widget>[
          _codingTechniqueSelector(),
        ],
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
