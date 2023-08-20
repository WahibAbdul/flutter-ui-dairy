import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ui_dairy/projects/coffee_shop/coffee_home_page.dart';
import 'package:ui_dairy/projects/coffee_shop/components/coffee_cup_size_buttons.dart';
import 'package:ui_dairy/projects/coffee_shop/components/coffee_dark_icon_button.dart';
import 'package:ui_dairy/projects/coffee_shop/components/coffee_icon_with_title.dart';
import 'package:ui_dairy/projects/coffee_shop/components/coffee_text_chip.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';
import 'package:ui_dairy/sdk/constants/spacing.dart';

import 'coffee_app_constants.dart';

class CoffeeDetailPage extends StatefulWidget {
  final Coffee coffee;
  const CoffeeDetailPage(this.coffee, {super.key});

  @override
  State<CoffeeDetailPage> createState() => _CoffeeDetailPageState();
}

class _CoffeeDetailPageState extends State<CoffeeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeAppConstants.backgroundColor,
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildTopSection(context)),
        Expanded(child: _buildBottomSection(context)),
      ],
    );
  }

  Widget _buildTopSection(BuildContext context) {
    return Stack(
      children: [
        // Build Image
        _buildImage(context),
        // Build App bar
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.margin),
          child: _buildAppbar(context),
        )),
        // Build Info
        Positioned(
          bottom: 0,
          child: _buildInformationCard(context),
        ),
      ],
    );
  }

  Widget _buildAppbar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CoffeeDarkIconButton(
          icon: Icons.arrow_back_ios_new,
          onTap: () => Navigator.of(context).pop(),
        ),
        const CoffeeDarkIconButton(icon: Icons.favorite),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(CoffeeAppConstants.cardRadius),
        bottomRight: Radius.circular(CoffeeAppConstants.cardRadius),
      ),
      child: Image.asset(
        widget.coffee.imagePath,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildInformationCard(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(CoffeeAppConstants.cardRadius),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            // Blur Filter
            Container(
              color: Colors.black.withOpacity(0.5),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(color: Colors.transparent),
              ),
            ),
            // Information
            Container(
              padding: const EdgeInsets.symmetric(horizontal: Dimens.marginLarge, vertical: Dimens.marginExtra),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Coffee Detail
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.coffee.name,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "With ${widget.coffee.extra}",
                        style: const TextStyle(fontSize: 17, color: Colors.grey),
                      ),
                      Spacing.vMedium,
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.star,
                            color: CoffeeAppConstants.secondaryColor,
                            size: 24,
                          ),
                          Spacing.hSmall,
                          Text(
                            widget.coffee.rating,
                            style: const TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Spacing.hSmall,
                          Text(
                            "(6,986)",
                            style: TextStyle(fontSize: 12, color: CoffeeAppConstants.secondaryTextColor),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const CoffeeIconWithTitle(Icons.coffee, "Coffee"),
                          Spacing.horizontal,
                          const CoffeeIconWithTitle(Icons.water_drop, "Milk"),
                        ],
                      ),
                      Spacing.vMedium,
                      const CoffeeTextChip("Medium Roasted"),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.margin, vertical: Dimens.marginExtra),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDescription(context),
          Spacing.vLarge,
          _buildSize(context),
          Spacing.vExtra,
          const Expanded(child: SizedBox()),
          _buildPriceAndBuy(context),
          Spacing.vExtra,
        ],
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(color: CoffeeAppConstants.secondaryTextColor, fontSize: 17),
        ),
        Spacing.vXMedium,
        const Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          style: TextStyle(color: Colors.white, fontSize: 15),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildSize(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Size",
          style: TextStyle(color: CoffeeAppConstants.secondaryTextColor, fontSize: 17),
        ),
        Spacing.vertical,
        const CoffeeCupSizeButtons(),
      ],
    );
  }

  Widget _buildPriceAndBuy(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Price",
              style: TextStyle(fontSize: 15, color: CoffeeAppConstants.secondaryTextColor, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Text(
                  "\$",
                  style: TextStyle(fontSize: 24, color: CoffeeAppConstants.secondaryColor, fontWeight: FontWeight.bold),
                ),
                Spacing.hSmall,
                Text(
                  widget.coffee.price,
                  style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        Spacing.hLarge,
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: CoffeeAppConstants.secondaryColor,
                borderRadius: BorderRadius.circular(CoffeeAppConstants.buttonRadius)),
            child: const Center(
              child: Text(
                "Buy Now",
                style: TextStyle(fontSize: 21, color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        )
      ],
    );
  }
}
