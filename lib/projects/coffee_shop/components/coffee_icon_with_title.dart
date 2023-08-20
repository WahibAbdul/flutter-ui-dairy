import 'package:flutter/material.dart';
import 'package:ui_dairy/projects/coffee_shop/coffee_app_constants.dart';
import 'package:ui_dairy/sdk/constants/spacing.dart';

class CoffeeIconWithTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  const CoffeeIconWithTitle(this.icon, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: CoffeeAppConstants.grey,
        borderRadius: BorderRadius.circular(CoffeeAppConstants.buttonRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: CoffeeAppConstants.secondaryColor,
            size: 20,
          ),
          Spacing.vSmall,
          Text(
            title,
            style: TextStyle(fontSize: 12, color: CoffeeAppConstants.secondaryTextColor, fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
