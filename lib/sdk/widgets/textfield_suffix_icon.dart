import 'package:flutter/material.dart';

class TextFieldSuffixIcon extends StatelessWidget {
  final IconData icon;
  const TextFieldSuffixIcon(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withAlpha(50),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(8),
      width: 20,
      height: 20,
      child: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}
