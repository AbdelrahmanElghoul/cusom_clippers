///
/// Author: Damodar Lohani
/// profile: https://github.com/lohanidamodar
///

import 'package:flutter/material.dart';

class ZegzagClipper extends CustomClipper<Path> {
  double get heightRatio => startRatio + .15;

  double startRatio = .4;
  final double hPadding;
  ZegzagClipper({this.hPadding=20});
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
    path.arcToPoint(
      Offset(size.width-hPadding, size.height*heightRatio),
      // radius:const Radius.circular(100),
      radius:const Radius.elliptical(100, 10),
    );
    path.arcToPoint(
      Offset(size.width-hPadding, size.height*heightRatio),
      // radius:const Radius.circular(100),
      radius:const Radius.elliptical(100, 10),
    );
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
