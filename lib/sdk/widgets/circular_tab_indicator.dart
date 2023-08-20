import 'package:flutter/material.dart';

class CircularTabIndicator extends Decoration {
  final Color color;

  const CircularTabIndicator(this.color);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CircularTabIndicatorPainter(this, onChanged, color);
  }
}

class _CircularTabIndicatorPainter extends BoxPainter {
  final CircularTabIndicator decoration;
  final Color color;

  _CircularTabIndicatorPainter(this.decoration, VoidCallback? onChanged, this.color) : super(onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final rect = Offset(offset.dx - 5 + configuration.size!.width / 2, configuration.size!.height - 10) &
        const Size(10, 10); // Custom indicator size and position
    final paint = Paint()
      ..color = color // Custom indicator color
      ..style = PaintingStyle.fill;
    canvas.drawRRect(RRect.fromRectAndRadius(rect, const Radius.circular(5)), paint);
  }
}
