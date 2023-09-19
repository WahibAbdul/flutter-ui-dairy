import 'package:flutter/material.dart';
import 'package:ui_dairy/sdk/constants/spacing.dart';

class CSPQuantityCounter extends StatefulWidget {
  final Function(int) onQuantityChanged;
  const CSPQuantityCounter({super.key, required this.onQuantityChanged});

  @override
  State<CSPQuantityCounter> createState() => _CSPQuantityCounterState();
}

class _CSPQuantityCounterState extends State<CSPQuantityCounter> {
  var quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: () => _changeQuantity(false), icon: const Icon(Icons.remove)),
        Spacing.hExtra,
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
          ),
          height: 50,
          width: 50,
          child: Center(
            child: Text(
              "$quantity",
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Spacing.hExtra,
        IconButton(onPressed: () => _changeQuantity(true), icon: const Icon(Icons.add)),
      ],
    );
  }

  _changeQuantity(bool isIncrement) {
    if (isIncrement == true && quantity < 99) {
      setState(() {
        quantity += 1;
      });
    } else if (isIncrement == false && quantity > 1) {
      setState(() {
        quantity -= 1;
      });
    }
  }
}
