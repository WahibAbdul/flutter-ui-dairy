import 'package:flutter/material.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';

class SRQuantityCounter extends StatefulWidget {
  final Function(int) onQuantityChanged;
  const SRQuantityCounter({super.key, required this.onQuantityChanged});

  @override
  State<SRQuantityCounter> createState() => _SRQuantityCounterState();
}

class _SRQuantityCounterState extends State<SRQuantityCounter> {
  var _quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(context, Icons.remove, () {
          if (_quantity > 1) {
            setState(() {
              _quantity -= 1;
            });
          }
        }),
        SizedBox(
          width: 60,
          child: Center(
            child: Text(
              _quantity.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        _buildIconButton(context, Icons.add, () {
          setState(() {
            _quantity += 1;
          });
        }),
      ],
    );
  }

  Widget _buildIconButton(BuildContext context, IconData icon, Function onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(Dimens.marginMedium),
        decoration: BoxDecoration(
          color: const Color.fromARGB(212, 135, 81, 77),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
