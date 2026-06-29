import 'package:flutter/material.dart';

class HeritagePainter extends CustomPainter {
  final List<String> names;
  HeritagePainter({required this.names});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF5D4037) // لون جذع الشجرة
      ..style = PaintingStyle.fill;

    // رسم الأسماء كأشكال بيضاوية (بدل المربعات)
    for (int i = 0; i < names.length; i++) {
      double y = 50.0 + (i * 60.0);
      canvas.drawOval(
        Rect.fromCenter(center: Offset(size.width / 2, y), width: 120, height: 40),
        paint,
      );
      
      final textSpan = TextSpan(
        text: names[i],
        style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
      );
      final textPainter = TextPainter(text: textSpan, textDirection: TextDirection.rtl)..layout();
      textPainter.paint(canvas, Offset(size.width / 2 - textPainter.width / 2, y - 10));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
