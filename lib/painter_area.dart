import 'package:flutter/material.dart';

import 'painter/axis_painter.dart';
import 'painter/polarNRZ_painter.dart';
import 'painter/unipolarNRZ_painter.dart';
import 'painter/unipolarRZ_painter.dart';

class PainterArea extends StatelessWidget {
  final String _bitStream;
  final String _type;
  PainterArea(this._bitStream, this._type);

  CustomPainter _painterSelector(String _bitStream, String _type) {
    switch (_type) {
      case "unipolarNRZ":
        return UnipolarNRZPainter(_bitStream);
        break;

      case "unipolarRZ":
        return UnipolarRZPainter(_bitStream);
        break;

      case "polarNRZ":
        return PolarNRZPainter(_bitStream);
        break;

      // case "polarRZ":
      //   return PolarRZPainter(_bitStream);
      //   break;

      default:
        return UnipolarNRZPainter(_bitStream);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: _painterSelector(_bitStream, _type),
      painter: AxisPainter(_bitStream, _type),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 200,
        ),
      ),
    );
  }
}
