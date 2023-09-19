import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_dairy/projects/coffee_shop_plain/components/csp_coffee_tile.dart';
import 'package:ui_dairy/projects/coffee_shop_plain/models/csp_shop_model.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';
import 'package:ui_dairy/sdk/constants/spacing.dart';

class CSPCartPage extends StatefulWidget {
  const CSPCartPage({super.key});

  @override
  State<CSPCartPage> createState() => _CSPCartPageState();
}

class _CSPCartPageState extends State<CSPCartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CSPShop>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: Colors.grey.shade300,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(Dimens.marginExtra),
                  child: Column(
                    children: [
                      const Text(
                        "Your Cart",
                        style: TextStyle(fontSize: 20),
                      ),
                      Spacing.vLarge,
                      Expanded(
                        child: ListView.builder(
                          itemCount: value.userCart.length,
                          itemBuilder: (context, index) {
                            final coffee = value.userCart[index];
                            return CSPCoffeeTile(
                              coffee,
                              onPressed: () {
                                // Provider.of<CSPShop>(context, listen: false).removeItemFromCart(coffee);
                                // ScaffoldMessenger.of(context).removeCurrentSnackBar();
                                // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                //   content: Text("Coffee Removed!"),
                                //   showCloseIcon: true,
                                // ));
                              },
                            );
                          },
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.brown,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        width: double.infinity,
                        padding: const EdgeInsets.all(Dimens.marginExtra),
                        child: const Text(
                          "Pay Now",
                          style: TextStyle(fontSize: 17, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
