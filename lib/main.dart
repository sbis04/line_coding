import 'package:flutter/material.dart';

String textString = "";
bool isValid = false;

typedef TextCallback = void Function(String textStr, bool valid);

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

class LineCoding extends StatefulWidget {
  @override
  _LineCodingState createState() => _LineCodingState();
}

class _LineCodingState extends State<LineCoding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Line Coding"),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          RetreiveCode(onTextChange: (String str, bool valid) {
            setState(() {
              textString = str;
              isValid = valid;
            });
          }),
          (textString == "" || isValid == false)
              ? Container()
              : PainterArea(textString),
        ],
      ),
    );
  }
}

class RetreiveCode extends StatefulWidget {
  const RetreiveCode({this.onTextChange});
  final TextCallback onTextChange;

  @override
  _RetreiveCodeState createState() => _RetreiveCodeState();
}

class _RetreiveCodeState extends State<RetreiveCode> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
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
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Enter binary code',
                errorText: _validateString(textController.text),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
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
            color: Colors.orange[800],
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

class PainterArea extends StatelessWidget {
  final String _bitStream;
  PainterArea(this._bitStream);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: LineCodingPainter(_bitStream),
      painter: AxisPainter(),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 200,
        ),
      ),
    );
  }
}

class AxisPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.black54;
    paint.strokeWidth = 2;
    paint.strokeCap = StrokeCap.round;

    var startingPoint = Offset(30, size.height / 2);
    var endingPointY = Offset(30, size.height / 2 - 200);
    var endingPointX = Offset(size.width - 30, size.height / 2);

    canvas.drawLine(startingPoint, endingPointY, paint);
    canvas.drawLine(startingPoint, endingPointX, paint);

    canvas.drawLine(endingPointX, endingPointX + Offset(-12, 12), paint);
    canvas.drawLine(endingPointX, endingPointX + Offset(-12, -12), paint);

    canvas.drawLine(endingPointY, endingPointY + Offset(12, 12), paint);
    canvas.drawLine(endingPointY, endingPointY + Offset(-12, 12), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class LineCodingPainter extends CustomPainter {
  final String _bitStream;
  LineCodingPainter(this._bitStream);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.red;
    paint.strokeWidth = 4;
    paint.strokeCap = StrokeCap.round;

    var startingPoint;
    var endingPoint = Offset(30, size.height / 2);

    int previousBit = 0;
    bool upp = false;

    double _availableWidth = size.width - 70;
    double _eachSignalBitWidth = _availableWidth / _bitStream.length;

    for (int i = 0; i < _bitStream.length; i++) {
      int presentBit = int.parse(_bitStream[i]);
      if (presentBit == 1) {
        upp = true;
      } else {
        upp = false;
      }

      print("Present Bit: " + presentBit.toString());
      if (presentBit == previousBit) {
        print("equal");
        startingPoint = endingPoint;
        endingPoint = endingPoint + Offset(_eachSignalBitWidth, 0);
        canvas.drawLine(
          startingPoint,
          endingPoint,
          paint,
        );
      } else {
        startingPoint = endingPoint;
        endingPoint = endingPoint +
            Offset(0, upp == true ? -_eachSignalBitWidth : _eachSignalBitWidth);
        canvas.drawLine(
          startingPoint,
          endingPoint,
          paint,
        );

        startingPoint = endingPoint;
        endingPoint = endingPoint + Offset(_eachSignalBitWidth, 0);
        canvas.drawLine(
          startingPoint,
          endingPoint,
          paint,
        );
      }
      previousBit = presentBit;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
