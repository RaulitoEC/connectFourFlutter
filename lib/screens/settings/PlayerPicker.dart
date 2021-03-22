import 'dart:math';
import 'package:flutter/material.dart';

class PlayerPicker extends CustomPainter {
  int a;
  int b;
  int currentPlayer; // p1 = 1, p2 = 2

  PlayerPicker(this.a, this.b, this.currentPlayer);

  @override
  paint(Canvas canvas, Size size) {
    double overhangTip = (0.75 * a)/(tan(45));

    if (currentPlayer == 1) {
      double left = (size.width / 2) - (b - overhangTip);
      double top = (size.height / 2) - (0.75 * a);
      double right = (size.width / 2) + overhangTip;
      double bottom = (size.height / 2) + (0.75 * a);

      double left2 = (size.width / 2) - overhangTip;
      double top2 = (size.height / 2) - (0.75 * 20);
      double right2 = (size.width / 2) + (b - overhangTip);
      double bottom2 = (size.height / 2) + (0.75 * 20);

      final shapeBounds = Rect.fromLTRB(left, bottom, right, top);
      final backgroundPaint = Paint()..color = Colors.yellow[500];
      final shadowPaint2 = Paint()..color = Colors.black.withOpacity(0.7);

      final backgroundShape = Path()
        ..moveTo(shapeBounds.left, shapeBounds.bottom) // topleft corner
        ..lineTo(shapeBounds.bottomLeft.dx, shapeBounds.topLeft.dy)
        ..lineTo(shapeBounds.topRight.dx * 0.8555, shapeBounds.topRight.dy)
        ..lineTo(shapeBounds.bottomRight.dx, shapeBounds.bottomRight.dy)
        ..close();

      final shadowShape2 = Path()
        ..moveTo(shapeBounds.topRight.dx * 0.80, shapeBounds.topRight.dy)
        ..lineTo(shapeBounds.topRight.dx * 0.84, shapeBounds.topRight.dy)
        ..lineTo(shapeBounds.bottomRight.dx * 0.94, shapeBounds.topRight.dy * 0.4)
        ..lineTo(shapeBounds.bottomRight.dx * 0.90, shapeBounds.topRight.dy * 0.4)
        ..close();

      canvas.drawRect(Rect.fromLTRB(left2, bottom2, right2, top2), Paint()..color = Colors.red[800]);
      canvas.drawPath(backgroundShape, backgroundPaint);
      canvas.drawPath(shadowShape2, shadowPaint2);
    } else {
      double left = (size.width / 2) - (b - overhangTip);
      double top = (size.height / 2) - (0.75 * 20);
      double right = (size.width / 2) + overhangTip;
      double bottom = (size.height / 2) + (0.75 * 20);

      double left2 = (size.width / 2) - overhangTip;
      double top2 = (size.height / 2) - (0.75 * a);
      double right2 = (size.width / 2) + (b - overhangTip);
      double bottom2 = (size.height / 2) + (0.75 * a);

      final shapeBounds = Rect.fromLTRB(left2, bottom2, right2, top2);
      final backgroundPaint = Paint()..color =  Colors.red[800];
      final shadowPaint2 = Paint()..color = Colors.white.withOpacity(0.7);

      final backgroundShape = Path()
        ..moveTo(shapeBounds.left, shapeBounds.top) // bottomleft corner
        ..lineTo(shapeBounds.topRight.dx, shapeBounds.topLeft.dy)
        ..lineTo(shapeBounds.bottomRight.dx, shapeBounds.bottomRight.dy)
        ..lineTo(shapeBounds.bottomLeft.dx * 1.1445, shapeBounds.bottomLeft.dy)
        ..close();

      final shadowShape2 = Path()
        ..moveTo(shapeBounds.bottomLeft.dx * 1.17, shapeBounds.bottomLeft.dy)
        ..lineTo(shapeBounds.bottomLeft.dx * 1.21, shapeBounds.bottomLeft.dy)
        ..lineTo(shapeBounds.topLeft.dx * 1.11, shapeBounds.topLeft.dy * 0.75)
        ..lineTo(shapeBounds.topLeft.dx * 1.07, shapeBounds.topLeft.dy * 0.75)
        ..close();

      canvas.drawRect(Rect.fromLTRB(left, bottom, right, top), Paint()..color = Colors.yellow[500]);
      canvas.drawPath(backgroundShape, backgroundPaint);
      canvas.drawPath(shadowShape2, shadowPaint2);
    }
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 3.0, Paint()..color = Colors.green);
    // canvas.drawCircle(Offset(size.width / 4, size.height / 2), 3.0, Paint()..color = Colors.green);
    // canvas.drawCircle(Offset(size.width * 0.75, size.height / 2), 3.0, Paint()..color = Colors.green);
  }

  @override
  shouldRepaint(PlayerPicker oldDelegate) {
    return currentPlayer != oldDelegate.currentPlayer;
  }
}