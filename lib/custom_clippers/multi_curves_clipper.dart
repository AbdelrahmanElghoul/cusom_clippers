///
/// Author: Damodar Lohani
/// profile: https://github.com/lohanidamodar
///

import 'package:flutter/material.dart';

class MultiCurveClipper extends CustomClipper<Path> {
  final double heightFactor;
  final double curvesRatio;
  final double curveHeight;
  MultiCurveClipper({
    this.heightFactor = .5,
    this.curvesRatio = .2,
    this.curveHeight = 100,
  })  : assert(heightFactor <= 1),
        assert(curvesRatio <= 1);

  @override
  Path getClip(Size size) {
    Path path = Path();
    final double baseHeight = size.height * heightFactor;

    final List<Offset> downCurve = [
      Offset(0, baseHeight),
      Offset(size.width * curvesRatio * .5, baseHeight + (curveHeight*curvesRatio)),
      Offset((size.width * curvesRatio), baseHeight),
    ];
    final List<Offset> upCurve = [
      downCurve[2],
      Offset(size.width - (size.width * (1 - curvesRatio) * .5),
          baseHeight - (curveHeight*(1-curvesRatio))),
      Offset(size.width, baseHeight),
    ];

    path.lineTo(downCurve[0].dx, downCurve[0].dy);
    path.quadraticBezierTo(
      downCurve[1].dx,
      downCurve[1].dy,
      downCurve[2].dx,
      downCurve[2].dy,
    );

    path.quadraticBezierTo(
      upCurve[1].dx,
      upCurve[1].dy,
      upCurve[2].dx,
      upCurve[2].dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(old) => old != this;
}
