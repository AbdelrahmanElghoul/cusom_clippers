
import 'dart:math';

import 'package:flutter/material.dart';

class CircleClipper extends CustomClipper<Path> {
  final double angel;
  final bool reClip;
  CircleClipper(this.angel,{this.reClip=true});
  double toRadians(num deg) {
    double radian= (deg * pi) / 180.0;
    print(radian);
    return radian;
  }

  @override
  Path getClip(Size size) {
    Path path = Path();

    // path.lineTo(size.width / 2, size.height);
    path.moveTo(size.width/2,size.width/2);
    path.lineTo(size.width/2,size.width/2);
    path.arcTo(
      Rect.fromCircle(
        center: Offset(
          size.width / 2,
          size.width / 2,
        ),
        radius: size.width / 2,
      ),
      toRadians(-1),
      toRadians(angel),
      false,
    );
    // path.lineTo(0, size.height);

    // path.lineTo(size.width, size.height);
    // path.lineTo(size.width, size.height/2);
    return path;
  }

  @override
  bool shouldReclip(old) => old != this;
}
