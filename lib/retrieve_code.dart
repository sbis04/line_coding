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

String textString = "";
bool isValid = false;

typedef TextCallback = void Function(String textStr, bool valid);

class RetreiveCode extends StatefulWidget {
  const RetreiveCode({this.onTextChange});
  final TextCallback onTextChange;

  @override
  _RetreiveCodeState createState() => _RetreiveCodeState();
}

class _RetreiveCodeState extends State<RetreiveCode> {
  final textController = TextEditingController();
  FocusNode textFocusNode;

  @override
  void initState() {
    super.initState();
    textFocusNode = FocusNode();
  }

  @override
  void dispose() {
    textController.dispose();
    textFocusNode.dispose();
    super.dispose();
  }

  String _validateString(String value) {
    if (value.isEmpty) {
      return 'Value Can\'t Be Empty';
    } else {
      final regex = RegExp("[01]+");
      final matches = regex.allMatches(value);
      for (Match match in matches) {
        if (match.start == 0 && match.end == value.length) {
          return null;
        }
      }
    }
    return 'Not a binary string';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            width: 180,
            child: TextField(
              focusNode: textFocusNode,
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Enter binary code',
                errorText: _validateString(textController.text),
                errorStyle: TextStyle(fontSize: 15, color: Colors.redAccent),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              FocusScope.of(context).unfocus();
              setState(() {
                if (textController.text.isEmpty == true ||
                    _validateString(textController.text) != null) {
                  isValid = false;
                } else {
                  isValid = true;
                }
              });
              setState(() {
                textString = textController.text;
                widget.onTextChange(textString, isValid);
              });
            },
            color: Theme.of(context).buttonColor,
            child: Text(
              "DRAW",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          )
        ],
      ),
    );
  }
}
