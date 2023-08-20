import 'package:flutter/material.dart';
import 'package:ui_dairy/projects/coffee_shop/coffee_app_constants.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';

class CoffeeTextChip extends StatelessWidget {
  final String text;
  const CoffeeTextChip(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      padding: const EdgeInsets.all(Dimens.marginXMedium),
      decoration: BoxDecoration(
        color: CoffeeAppConstants.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12, color: CoffeeAppConstants.secondaryTextColor, fontWeight: FontWeight.w600),
      ),
    );
  }
}
