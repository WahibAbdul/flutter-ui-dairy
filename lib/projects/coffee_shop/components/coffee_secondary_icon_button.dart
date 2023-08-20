import 'package:flutter/material.dart';
import 'package:ui_dairy/projects/coffee_shop/coffee_app_constants.dart';

class CoffeeSecondaryIconButton extends StatelessWidget {
  final IconData icon;
  const CoffeeSecondaryIconButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: CoffeeAppConstants.secondaryColor,
      ),
      child: Icon(
        icon,
        size: 25,
        color: Colors.white,
      ),
    );
  }
}
