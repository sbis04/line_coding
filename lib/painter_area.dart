import 'package:flutter/material.dart';
import 'package:line_coding/painter/polar_NRZ_painter.dart';

import 'painter/axis_painter.dart';
import 'painter/unipolar_NRZ_painter.dart';
import 'painter/unipolar_RZ_painter.dart';

class PainterArea extends StatelessWidget {
  final String _bitStream;
  final String _type;
  PainterArea(this._bitStream, this._type);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: PolarNRZPainter(_bitStream),
      painter: AxisPainter(_bitStream, _type),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 200,
        ),
      ),
    );
  }
}