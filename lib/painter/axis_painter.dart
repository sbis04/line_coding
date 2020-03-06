import 'package:flutter/material.dart';

class AxisPainter extends CustomPainter {
  final String _bitStream;
  AxisPainter(this._bitStream);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    var startingPoint = Offset(30, size.height / 2);
    var endingPointY = Offset(30, size.height / 2 - 200);
    var endingPointX = Offset(size.width - 30, size.height / 2);

    // Drawing the axis lines
    canvas.drawLine(startingPoint, endingPointY, paint);
    canvas.drawLine(startingPoint, endingPointX, paint);

    // Drawing the X-axis arrow
    canvas.drawLine(endingPointX, endingPointX + Offset(-12, 12), paint);
    canvas.drawLine(endingPointX, endingPointX + Offset(-12, -12), paint);

    // Drawing the Y-axis arrow
    canvas.drawLine(endingPointY, endingPointY + Offset(12, 12), paint);
    canvas.drawLine(endingPointY, endingPointY + Offset(-12, 12), paint);

    double _availableWidth = size.width - 70;
    double _eachSignalBitWidth = _availableWidth / _bitStream.length;

    if (_eachSignalBitWidth > 180) {
      _eachSignalBitWidth = 180;
    }

    var paintSeparator = Paint()
      ..color = Colors.black12
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    // Drawing the bit separators

    for (int i = 1; i < _bitStream.length; i++) {
      canvas.drawLine(
        endingPointY + Offset(_eachSignalBitWidth * i, 0),
        startingPoint + Offset(_eachSignalBitWidth * i, 0),
        paintSeparator,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}