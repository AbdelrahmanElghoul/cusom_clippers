
import 'package:flutter/material.dart';

class ArrowClipper extends CustomClipper<Path> {
  final double headRatio;
  final double headHeightRatio;
  final double rectangleHeight;

  ArrowClipper({
    this.headRatio = .3,
    this.headHeightRatio = .7,
    this.rectangleHeight = .3,
  });

  late double _centerHeight;

  @override
  Path getClip(Size size) {
    Path path = Path();
    _centerHeight = size.height * .5;
    _arrowHead(path: path, size: size);
    _arrowBody(path: path, size: size);

    path.close();
    return path;
  }

  void _arrowBody({required Path path, required Size size}) {
    final double startHeight =
        _centerHeight - (size.height * (rectangleHeight / 2));
    final double endHeight =
        _centerHeight + (size.height * (rectangleHeight / 2));
    final double startWidth = size.width * headRatio;
    final double endWidth = size.width;

    path.moveTo(startWidth, startHeight);
    path.lineTo(endWidth, startHeight);
    path.lineTo(endWidth, endHeight);
    path.lineTo(startWidth, endHeight);
  }

  void _arrowHead({required Path path, required Size size}) {
    path.moveTo(0, _centerHeight);
    final double startHeight =
        _centerHeight - (size.height * (headHeightRatio / 2));
    final double endHeight =
        _centerHeight + (size.height * (headHeightRatio / 2));
    path.lineTo(size.width * headRatio, startHeight);
    path.lineTo(size.width * headRatio, endHeight);
  }

  @override
  bool shouldReclip(old) => old != this;
}
