import 'package:flutter/material.dart';

class AxisPainter extends CustomPainter {
  final BuildContext context;
  final String _bitStream;
  final String _type;
  AxisPainter(this.context, this._bitStream, this._type);

  @override
  void paint(Canvas canvas, Size size) {
    bool _requireExtendedAxis = true;

    var _codingStyleRequiringExtendedAxis = ["unipolarNRZ", "unipolarRZ"];
    if (_codingStyleRequiringExtendedAxis.contains(_type)) {
      _requireExtendedAxis = false;
    }

    var paint = Paint()
      ..color = Theme.of(context).highlightColor
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    var startingPoint = Offset(30, size.height / 2);
    var endingPointY = Offset(30, size.height / 2 - 200);
    var endingPointX = Offset(size.width - 30, size.height / 2);

    double _availableWidth = size.width - 70;
    double _eachSignalBitWidth = _availableWidth / _bitStream.length;

    if (_eachSignalBitWidth > 180) {
      _eachSignalBitWidth = 180;
    }

    // Drawing the axis lines
    canvas.drawLine(
        _requireExtendedAxis
            ? startingPoint + Offset(0, _eachSignalBitWidth)
            : startingPoint,
        endingPointY,
        paint);
    canvas.drawLine(startingPoint, endingPointX, paint);

    // Drawing the X-axis arrow
    canvas.drawLine(endingPointX, endingPointX + Offset(-12, 12), paint);
    canvas.drawLine(endingPointX, endingPointX + Offset(-12, -12), paint);

    // Drawing the Y-axis arrow
    canvas.drawLine(endingPointY, endingPointY + Offset(12, 12), paint);
    canvas.drawLine(endingPointY, endingPointY + Offset(-12, 12), paint);

    var paintSeparator = Paint()
      ..color = Theme.of(context).dividerColor
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    // Drawing the bit separators

    for (int i = 1; i < _bitStream.length; i++) {
      canvas.drawLine(
        endingPointY + Offset(_eachSignalBitWidth * i, 0),
        startingPoint +
            Offset(_eachSignalBitWidth * i,
                _requireExtendedAxis ? _eachSignalBitWidth : 0),
        paintSeparator,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
