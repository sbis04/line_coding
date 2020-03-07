import 'package:flutter/material.dart';

class UnipolarRZPainter extends CustomPainter {
  final BuildContext context;
  final String _bitStream;
  UnipolarRZPainter(this.context, this._bitStream);

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
        endingPoint = endingPoint + Offset(_eachSignalBitWidth, 0);
        canvas.drawLine(
          startingPoint,
          endingPoint,
          paint,
        );

        // double _bitWidth =
        //     upp == true ? _eachSignalBitWidth : -_eachSignalBitWidth;

        textPainter.paint(
          canvas,
          startingPoint +
              Offset(
                _eachSignalBitWidth / 2 - 5,
                30,
              ),
        );
      } else {
        // double _bitWidth =
        //     upp == true ? -_eachSignalBitWidth : _eachSignalBitWidth;
        startingPoint = endingPoint;
        endingPoint = endingPoint + Offset(0, -(_eachSignalBitWidth));
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
                30,
              ),
        );

        // textPainter.paint(
        //   canvas,
        //   startingPoint +
        //       Offset(
        //         _eachSignalBitWidth / 2 - 5,
        //         _bitWidth > 0 ? _bitWidth + 30 : 30,
        //       ),
        // );

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
      // previousBit = presentBit;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
