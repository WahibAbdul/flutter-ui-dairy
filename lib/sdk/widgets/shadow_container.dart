import 'package:flutter/material.dart';

class ShadowContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final EdgeInsets? margin;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final EdgeInsets? padding;

  const ShadowContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius ?? BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(40),
            blurRadius: 5.0, // has the effect of softening the shadow
            spreadRadius: 1.0, // has the effect of extending the shadow
            offset: const Offset(
              0, // horizontal, move right 10
              0, // vertical, move down 10
            ),
          )
        ],
      ),
      child: child,
    );
  }
}
