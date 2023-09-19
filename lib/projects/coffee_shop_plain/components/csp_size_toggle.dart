import 'package:flutter/material.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';

class CSPSizeToggle extends StatefulWidget {
  final Function(String) onSizeSelected;
  const CSPSizeToggle({super.key, required this.onSizeSelected});

  @override
  State<CSPSizeToggle> createState() => _CSPSizeToggleState();
}

class _CSPSizeToggleState extends State<CSPSizeToggle> {
  var selectedSize = "S";
  final sizes = ["S", "M", "L"];
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var s in sizes)
          GestureDetector(
            onTap: () {
              setState(() {
                selectedSize = s;
              });
            },
            child: Container(
              width: 50,
              height: 50,
              margin: const EdgeInsets.only(right: Dimens.marginMedium),
              decoration: BoxDecoration(
                  color: s == selectedSize ? Colors.brown : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  s,
                  style: TextStyle(
                    fontSize: 20,
                    color: s == selectedSize ? Colors.grey.shade100 : Colors.brown,
                  ),
                ),
              ),
            ),
          )
      ],
    );
  }
}
