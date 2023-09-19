import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_dairy/projects/coffee_shop_plain/components/csp_quantity_counter.dart';
import 'package:ui_dairy/projects/coffee_shop_plain/components/csp_size_toggle.dart';
import 'package:ui_dairy/projects/coffee_shop_plain/models/csp_coffee_model.dart';
import 'package:ui_dairy/projects/coffee_shop_plain/models/csp_shop_model.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';
import 'package:ui_dairy/sdk/constants/spacing.dart';

class CSPAddPage extends StatefulWidget {
  final CSPCoffee coffee;
  const CSPAddPage(this.coffee, {super.key});

  @override
  State<CSPAddPage> createState() => _CSPAddPageState();
}

class _CSPAddPageState extends State<CSPAddPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CSPShop>(
      builder: ((context, value, child) => Scaffold(
            backgroundColor: Colors.grey.shade300,
            appBar: AppBar(
              title: Text(widget.coffee.name),
              backgroundColor: Colors.transparent,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  widget.coffee.imagePath,
                  width: 150,
                  height: 150,
                ),
                Spacing.vXLarge,
                const Text(
                  "QUANTITY",
                  style: TextStyle(fontSize: 20, letterSpacing: 4, color: Colors.brown),
                ),
                Spacing.vertical,
                CSPQuantityCounter(onQuantityChanged: (quantity) {}),
                Spacing.vLarge,
                const Text(
                  "SIZE",
                  style: TextStyle(fontSize: 20, letterSpacing: 4, color: Colors.brown),
                ),
                Spacing.vertical,
                CSPSizeToggle(onSizeSelected: (size) {}),
                Spacing.vXLarge,
                _buildAddToCartButton(context),
              ],
            ),
          )),
    );
  }

  Widget _buildAddToCartButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<CSPShop>(context, listen: false).addItemToCart(widget.coffee);
        Navigator.of(context).pop();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.brown,
          borderRadius: BorderRadius.circular(12),
        ),
        width: 300,
        padding: const EdgeInsets.all(Dimens.marginExtra),
        child: const Text(
          "Add to cart",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
