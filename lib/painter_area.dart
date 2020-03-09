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
