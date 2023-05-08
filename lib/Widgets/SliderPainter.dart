import 'package:flutter/material.dart';

class SliderPainter extends CustomPainter {
  final double position;

  SliderPainter({required this.position});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black.withOpacity(0.75);
    final sliderWidth = size.width / 4;
    final sliderPosition = position * size.width;
    final rect = Rect.fromLTWH(sliderPosition/1.33, 0, sliderWidth, size.height);
    final borderRadius = BorderRadius.circular(20.0);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(20));
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(SliderPainter oldDelegate) =>
      oldDelegate.position != position;
}