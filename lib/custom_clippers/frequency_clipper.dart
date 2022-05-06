import 'package:flutter/material.dart';

/// frequency means full cycle (1 up and 1 down)
class FrequencyClipper extends CustomClipper<Path> {
  final int count;
  final double heightRatio;
  FrequencyClipper({this.count = 4, this.heightRatio = .5});
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double mainDx = size.height * heightRatio;
    path.moveTo(0, mainDx);
    for (int i = 1; i <= count; i++) {
      double startDx = (size.width / count) * (i - 1);
      double endDx = (size.width / count) * i;

      path.quadraticBezierTo(
        startDx + ((endDx - startDx) * .25),
        0,
        startDx + ((endDx - startDx) * .5),
        mainDx,
      );
      path.quadraticBezierTo(
        startDx + ((endDx - startDx) * .75),
        size.height,
        endDx,
        mainDx,
      );
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(old) => true;
}
