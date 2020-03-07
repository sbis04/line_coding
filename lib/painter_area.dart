import 'package:flutter/material.dart';
import 'package:line_coding/painter/bipolarNRZ_painter.dart';

import 'painter/axis_painter.dart';
import 'painter/bipolarRZ_painter.dart';
import 'painter/polarNRZ_painter.dart';
import 'painter/polarRZ_painter.dart';
import 'painter/unipolarNRZ_painter.dart';
import 'painter/unipolarRZ_painter.dart';

class PainterArea extends StatelessWidget {
  final String _bitStream;
  final String _type;
  PainterArea(this._bitStream, this._type);

  CustomPainter _painterSelector(
      BuildContext context, String _bitStream, String _type) {
    switch (_type) {
      case "unipolarNRZ":
        return UnipolarNRZPainter(context, _bitStream);
        break;

      case "unipolarRZ":
        return UnipolarRZPainter(context, _bitStream);
        break;

      case "polarNRZ":
        return PolarNRZPainter(context, _bitStream);
        break;

      case "polarRZ":
        return PolarRZPainter(context, _bitStream);
        break;

      case "bipolarNRZ":
        return BipolarNRZPainter(context, _bitStream);
        break;

      case "bipolarRZ":
        return BipolarRZPainter(context, _bitStream);
        break;

      default:
        return UnipolarNRZPainter(context, _bitStream);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: _painterSelector(context, _bitStream, _type),
      painter: AxisPainter(context, _bitStream, _type),
      child: Center(
        child: Container(
          // color: Theme.of(context).backgroundColor,
          height: MediaQuery.of(context).size.height - 200,
        ),
      ),
    );
  }
}
