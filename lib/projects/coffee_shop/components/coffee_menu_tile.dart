import 'package:flutter/material.dart';
import 'package:ui_dairy/projects/coffee_shop/coffee_home_page.dart';
import 'package:ui_dairy/projects/coffee_shop/coffee_app_constants.dart';
import 'package:ui_dairy/projects/coffee_shop/components/coffee_secondary_icon_button.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';
import 'package:ui_dairy/sdk/constants/spacing.dart';

class CoffeeMenuTile extends StatelessWidget {
  final Coffee coffee;
  const CoffeeMenuTile(this.coffee, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.marginXMedium),
      width: 200,
      margin: const EdgeInsets.only(right: Dimens.marginExtra),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CoffeeAppConstants.cardRadius),
        gradient: CoffeeAppConstants.gradientBackground(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(CoffeeAppConstants.cardRadius),
                child: Image.asset(
                  coffee.imagePath,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 150,
                  // height: ,
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: Dimens.marginXMedium, vertical: Dimens.marginMedium),
                  decoration: BoxDecoration(
                    color: Colors.black.withAlpha(170),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(CoffeeAppConstants.buttonRadius),
                      topRight: Radius.circular(CoffeeAppConstants.cardRadius),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        color: CoffeeAppConstants.secondaryColor,
                        size: 17,
                      ),
                      Spacing.hSmall,
                      Text(
                        coffee.rating,
                        style: const TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Spacing.vXMedium,
          Text(
            coffee.name,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          Spacing.vSmall,
          Text(
            "With ${coffee.extra}",
            style: const TextStyle(fontSize: 15, color: Colors.grey),
          ),
          Spacing.vMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "\$",
                    style: TextStyle(
                      fontSize: 20,
                      color: CoffeeAppConstants.secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacing.hSmall,
                  Text(
                    coffee.price,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const CoffeeSecondaryIconButton(icon: Icons.add),
            ],
          )
        ],
      ),
    );
  }
}
