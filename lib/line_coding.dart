import 'package:flutter/material.dart';

import 'painter_area.dart';
import 'retrieve_code.dart';
import 'theme/custom_theme.dart';
import 'theme/themes.dart';

class LineCoding extends StatefulWidget {
  @override
  _LineCodingState createState() => _LineCodingState();
}

class _LineCodingState extends State<LineCoding> {
  MyThemeKeys _presentTheme = MyThemeKeys.LIGHT;

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

  void _changeTheme(BuildContext buildContext, MyThemeKeys key) {
    CustomTheme.instanceOf(buildContext).changeTheme(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _changeTheme(
                context,
                _presentTheme == MyThemeKeys.LIGHT
                    ? MyThemeKeys.DARK
                    : MyThemeKeys.LIGHT);
            _presentTheme == MyThemeKeys.LIGHT
                ? _presentTheme = MyThemeKeys.DARK
                : _presentTheme = MyThemeKeys.LIGHT;
          },
          icon: Icon(
            Icons.lightbulb_outline,
            size: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
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
