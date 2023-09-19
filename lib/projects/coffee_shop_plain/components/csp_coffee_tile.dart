import 'package:flutter/material.dart';
import 'package:ui_dairy/projects/coffee_shop_plain/models/csp_coffee_model.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';

class CSPCoffeeTile extends StatelessWidget {
  final CSPCoffee coffee;
  final void Function()? onPressed;
  final Widget? trailingIcon;
  const CSPCoffeeTile(
    this.coffee, {
    this.trailingIcon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed!();
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.only(bottom: Dimens.margin),
        padding: const EdgeInsets.only(top: Dimens.margin, bottom: Dimens.margin, left: Dimens.marginMedium),
        child: ListTile(
          title: Text(coffee.name),
          subtitle: Text("\$${coffee.price}"),
          leading: Image.asset(coffee.imagePath),
          trailing: trailingIcon,
        ),
      ),
    );
  }
}
