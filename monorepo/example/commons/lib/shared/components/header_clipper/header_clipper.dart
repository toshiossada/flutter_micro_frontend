import 'dart:math';

import 'package:flutter/material.dart';

class HeaderClipper extends CustomClipper<Path> {
  double moveFlag = 0;
  HeaderClipper(this.moveFlag);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.8);

    var xCenter =
        size.width * 0.5 + (size.width * 0.6 + 1) * sin(moveFlag * pi);
    var yCenter = size.height * 0.8 + 69 * cos(moveFlag * pi);
    path.quadraticBezierTo(xCenter, yCenter, size.width, size.height * 0.8);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
