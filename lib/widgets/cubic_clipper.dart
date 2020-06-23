import 'package:flutter/material.dart';

class CubicClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
// final path = Path();
    var controlPoint1 = Offset(size.width/3, 0);
    var controlPoint2 = Offset(size.width/2, size.height/1.5);
    var endPoint = Offset(size.width, size.height/2);

    Path path = Path()
      ..moveTo(size.width , 0)
      ..lineTo(0, 0)
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy)
      ..close();
    return path;
  }
  @override
  bool shouldReclip(CubicClipper oldClipper) => false;
}