import 'package:flutter/material.dart';
import 'package:ui_dairy/projects/coffee_shop_plain/coffee_shop_plain_home_page.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';
import 'package:ui_dairy/sdk/constants/spacing.dart';
import 'package:ui_dairy/sdk/utils/navigation_utils.dart';

class CSPIntroPage extends StatefulWidget {
  const CSPIntroPage({super.key});

  @override
  State<CSPIntroPage> createState() => _CSPIntroPageState();
}

class _CSPIntroPageState extends State<CSPIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "lib/images/coffee_plain_shop.png",
              width: 150,
              height: 150,
            ),
            Spacing.vXLarge,
            const Text(
              "Brew Day",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown),
            ),
            Spacing.vXMedium,
            const Text(
              "How do you like your coffee?",
              style: TextStyle(fontSize: 15, color: Colors.brown),
            ),
            Spacing.vLarge,
            _buildEnterShopButton(context)
          ],
        ),
      ),
    );
  }

  GestureDetector _buildEnterShopButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(getPageRoute((context) => const CoffeeShopPlainHomePage()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.circular(12),
        ),
        width: 300,
        padding: const EdgeInsets.all(Dimens.marginExtra),
        child: const Text(
          "Enter Shop",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
