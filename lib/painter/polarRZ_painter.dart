import 'package:flutter/material.dart';

class PolarRZPainter extends CustomPainter {
  final BuildContext context;
  final String _bitStream;
  PolarRZPainter(this.context, this._bitStream);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    var startingPoint;
    var endingPoint = Offset(30, size.height / 2);

    double _availableWidth = size.width - 70;
    double _eachSignalBitWidth = _availableWidth / _bitStream.length;

    if (_eachSignalBitWidth > 180) {
      _eachSignalBitWidth = 180;
    }

    for (int i = 0; i < _bitStream.length; i++) {
      int presentBit = int.parse(_bitStream[i]);

      // final textStyle = TextStyle(
      //   color: Colors.black,
      //   fontSize: 20,
      // );
      final textSpan = TextSpan(
        text: _bitStream[i],
        style: Theme.of(context).textTheme.caption,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: _eachSignalBitWidth,
      );

      print("Present Bit: " + presentBit.toString());
      if (presentBit == 0) {
        startingPoint = endingPoint;
        endingPoint = endingPoint + Offset(0, _eachSignalBitWidth);
        canvas.drawLine(
          startingPoint,
          endingPoint,
          paint,
        );

        textPainter.paint(
          canvas,
          startingPoint +
              Offset(
                _eachSignalBitWidth / 2 - 5,
                _eachSignalBitWidth + 30,
              ),
        );

        startingPoint = endingPoint;
        endingPoint = endingPoint + Offset(_eachSignalBitWidth / 2, 0);
        canvas.drawLine(
          startingPoint,
          endingPoint,
          paint,
        );

        startingPoint = endingPoint;
        endingPoint = endingPoint + Offset(0, -_eachSignalBitWidth);
        canvas.drawLine(
          startingPoint,
          endingPoint,
          paint,
        );

        startingPoint = endingPoint;
        endingPoint = endingPoint + Offset(_eachSignalBitWidth / 2, 0);
        canvas.drawLine(
          startingPoint,
          endingPoint,
          paint,
        );
      } else {
        startingPoint = endingPoint;
        endingPoint = endingPoint + Offset(0, -_eachSignalBitWidth);
        canvas.drawLine(
          startingPoint,
          endingPoint,
          paint,
        );

        textPainter.paint(
          canvas,
          startingPoint +
              Offset(
                _eachSignalBitWidth / 2 - 5,
                _eachSignalBitWidth + 30,
              ),
        );

        startingPoint = endingPoint;
        endingPoint = endingPoint + Offset(_eachSignalBitWidth / 2, 0);
        canvas.drawLine(
          startingPoint,
          endingPoint,
          paint,
        );

        startingPoint = endingPoint;
        endingPoint = endingPoint + Offset(0, _eachSignalBitWidth);
        canvas.drawLine(
          startingPoint,
          endingPoint,
          paint,
        );

        startingPoint = endingPoint;
        endingPoint = endingPoint + Offset(_eachSignalBitWidth / 2, 0);
        canvas.drawLine(
          startingPoint,
          endingPoint,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
