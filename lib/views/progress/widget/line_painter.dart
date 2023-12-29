import 'package:flutter/material.dart';

import '../../consts/app_colors.dart';

class LinePainter extends CustomPainter {
  final List<Offset> points;

  final double lineWidth;

  LinePainter({required this.points, this.lineWidth = 4});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.brownColor.withOpacity(0.8)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = lineWidth;

    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
