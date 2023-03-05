import 'package:flutter/material.dart';

class CustomCurvedClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    double w = size.width;
    double h = size.height;

    final path = Path();

    path.lineTo(0, h - 80);
    // path.lineTo(w / 2, h * 1.1);
    path.quadraticBezierTo(w / 2, h, w, h - 80);
    // path.lineTo(w, h);
    path.lineTo(w, 0);
    path.close();

    // throw UnimplementedError();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
