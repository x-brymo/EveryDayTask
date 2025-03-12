 import 'dart:math';

import 'package:flutter/material.dart';

Widget get3DBox({
      required int color1,
      required int color2,
      required int color3,
      required int color4,
      required int color5,
       BoxShadow? boxShadow = const BoxShadow(color: Colors.transparent),
      double start = 0.0,
      double top = 0.0,
      double scale = 1.0,
      double width = double.infinity,
      double height = double.infinity}) {
    Matrix4 matrix = Matrix4.identity();
    matrix.rotateZ(45 * pi);

    return Positioned.directional(
      textDirection: TextDirection.ltr,
      start: start,
      top: top,
      child: Transform.scale(
        scale: scale,
        child: Container(
          width: width,
          height: height,
          color: Colors.transparent,
          child: Stack(
            children: <Widget>[
              Positioned.directional(
                textDirection: TextDirection.ltr,
                top: 60,
                child: Transform(
                  transform: Matrix4.skewY(-50 / 100),
                  child: Container(
                    width: 110,
                    height: 120,
                    color: Color(color1),
                  ),
                ),
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: 110,
                child: Transform(
                  transform: Matrix4.skewY(50 / 100),
                  child: Container(
                    width: 110,
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: <Color>[
                          Color(color2),
                          Color(color3),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: 33,
                top: 102,
                child: Transform(
                  transform: Matrix4.rotationX(57 * pi),
                  origin: Offset(77, 77),
                  child: Transform(
                    transform: matrix,
                    origin: Offset(77, 77),
                    child: Container(
                      width: 156,
                      height: 156,
                      decoration: BoxDecoration(
                        boxShadow: [
                          boxShadow ?? BoxShadow(color: Colors.transparent),
                        ],
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: <Color>[
                            Color(color4),
                            Color(color5),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
/// Paints the background inclined lines.
class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();

    paint.color = Color(0xFF2B4A5B);

    var path = Path();

    path.lineTo(0, .21 * size.height);
    path.lineTo(0.26 * size.width, .28 * size.height);
    path.lineTo(0.26 * size.width, .45 * size.height);
    path.lineTo(0.565 * size.width, .521 * size.height);
    path.lineTo(0.85 * size.width, .44 * size.height);
    path.lineTo(size.width, .475 * size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
