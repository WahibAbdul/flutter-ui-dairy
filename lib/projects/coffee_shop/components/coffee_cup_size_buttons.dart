import 'package:flutter/material.dart';
import 'package:ui_dairy/projects/coffee_shop/coffee_app_constants.dart';
import 'package:ui_dairy/sdk/constants/spacing.dart';

class CoffeeCupSizeButtons extends StatefulWidget {
  const CoffeeCupSizeButtons({super.key});

  @override
  State<CoffeeCupSizeButtons> createState() => _CoffeeCupSizeButtonsState();
}

class _CoffeeCupSizeButtonsState extends State<CoffeeCupSizeButtons> {
  var _selectedSize = "S";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildButton(context, "S"),
        Spacing.hExtra,
        _buildButton(context, "M"),
        Spacing.hExtra,
        _buildButton(context, "L"),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String title) {
    final isSelected = _selectedSize == title;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedSize = title),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.transparent : CoffeeAppConstants.grey,
            borderRadius: BorderRadius.circular(CoffeeAppConstants.buttonRadius),
            border: isSelected
                ? Border.all(
                    color: CoffeeAppConstants.secondaryColor,
                    width: 1,
                  )
                : null,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                color: isSelected ? CoffeeAppConstants.secondaryColor : CoffeeAppConstants.secondaryTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
