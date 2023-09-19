import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_dairy/projects/coffee_shop_plain/components/csp_coffee_tile.dart';
import 'package:ui_dairy/projects/coffee_shop_plain/csp_add_page.dart';
import 'package:ui_dairy/projects/coffee_shop_plain/models/csp_shop_model.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';
import 'package:ui_dairy/sdk/constants/spacing.dart';
import 'package:ui_dairy/sdk/utils/navigation_utils.dart';

class CSPShopPage extends StatefulWidget {
  const CSPShopPage({super.key});

  @override
  State<CSPShopPage> createState() => _CSPShopPageState();
}

class _CSPShopPageState extends State<CSPShopPage> {
  @override
  Widget build(BuildContext parentContext) {
    return Consumer<CSPShop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Dimens.marginExtra),
            child: Column(
              children: [
                const Text(
                  "How would you like your coffee?",
                  style: TextStyle(fontSize: 20),
                ),
                Spacing.vLarge,
                Expanded(
                  child: ListView.builder(
                    itemCount: value.coffeeShop.length,
                    itemBuilder: (context, index) {
                      final coffee = value.coffeeShop[index];
                      return CSPCoffeeTile(
                        coffee,
                        trailingIcon: Icon(
                          Platform.isAndroid ? Icons.arrow_forward : Icons.arrow_forward_ios,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(getPageRoute((context) => CSPAddPage(coffee)));
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
