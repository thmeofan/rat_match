import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final List<Offset> buttonPositions;

  LinePainter(this.buttonPositions);

  @override
  void paint(Canvas canvas, Size size) {
    if (buttonPositions.isEmpty) return;

    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(buttonPositions[0].dx, buttonPositions[0].dy);
    for (int i = 1; i < buttonPositions.length; i++) {
      path.lineTo(buttonPositions[i].dx, buttonPositions[i].dy);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
