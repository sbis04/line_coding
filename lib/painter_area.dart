import 'package:flutter/material.dart';

import 'painter/axis_painter.dart';
import 'painter/unicode_NRZ_painter.dart';
import 'painter/unicode_RZ_painter.dart';

class PainterArea extends StatelessWidget {
  final String _bitStream;
  PainterArea(this._bitStream);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: UnicodeRZPainter(_bitStream),
      painter: AxisPainter(_bitStream),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 200,
        ),
      ),
    );
  }
}