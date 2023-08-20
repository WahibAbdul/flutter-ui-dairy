import 'package:flutter/material.dart';
import 'package:ui_dairy/projects/coffee_shop/coffee_app_constants.dart';

class CoffeeDarkIconButton extends StatelessWidget {
  final IconData icon;
  final Function? onTap;
  const CoffeeDarkIconButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CoffeeAppConstants.buttonRadius),
          gradient: CoffeeAppConstants.gradientBackground(),
        ),
        child: Icon(
          icon,
          size: 25,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
