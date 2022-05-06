///
/// Author: Damodar Lohani
/// profile: https://github.com/lohanidamodar
///

import 'package:flutter/material.dart';

class ArcClipper extends CustomClipper<Path> {
  double get heightRatio => startRatio + .5;
  double startRatio = .0;
  final double hPadding;
  ArcClipper({this.hPadding=20});
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(hPadding, size.height * startRatio);
    path.lineTo(hPadding, size.height * heightRatio);
    print(size.height*heightRatio);
    path.arcToPoint(
      Offset(size.width-hPadding, size.height*heightRatio),
      // radius:const Radius.circular(100),
      radius:const Radius.elliptical(100, 10),
    );
    path.lineTo(size.width-hPadding, size.height * startRatio);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(old) => old != this;
}
