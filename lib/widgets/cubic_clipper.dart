import 'package:flutter/material.dart';

class CubicClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    _constantSize = _constantSize ?? size;
    var controlPoint1 = Offset(_constantSize.width / 3, 0);
    var controlPoint2 =
        Offset(_constantSize.width / 2, _constantSize.height / 1.5);
    var endPoint = Offset(_constantSize.width, _constantSize.height / 2);

    Path path = Path()
      ..moveTo(_constantSize.width, 0)
      ..lineTo(0, 0)
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CubicClipper oldClipper) => false;
}

var _constantSize;
