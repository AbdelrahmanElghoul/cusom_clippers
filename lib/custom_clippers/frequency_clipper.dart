import 'dart:developer';

import 'package:flutter/material.dart';

/// frequency means full cycle (1 up and 1 down)
class FrequencyClipper extends CustomClipper<Path> {
  final int count;
  final double startPoint;
  double maxHeight;
  FrequencyClipper({this.count = 4, this.startPoint = .5, this.maxHeight = 1})
      : assert(maxHeight <= 1),
        assert(startPoint <= 1),
        assert(count >= 0);
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double mainDy = size.height * startPoint;
    final double highestSize = size.height * maxHeight;
    final double highestPoint = mainDy - highestSize;
    final double lowestPoint = mainDy + highestSize;
    path.moveTo(0, mainDy);
    for (int i = 1; i <= count; i++) {
      double startDx = (size.width / count) * (i - 1);
      double endDx = (size.width / count) * i;

      path.quadraticBezierTo(
        startDx + ((endDx - startDx) * .25),
        highestPoint,
        startDx + ((endDx - startDx) * .5),
        mainDy,
      );
      path.quadraticBezierTo(
        startDx + ((endDx - startDx) * .75),
        lowestPoint,
        endDx,
        mainDy,
      );
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(old) => true;
}
