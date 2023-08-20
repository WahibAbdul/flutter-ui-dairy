import 'package:flutter/material.dart';

class BodyContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  const BodyContainer({required this.child, super.key, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: padding,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: child,
    );
  }
}
