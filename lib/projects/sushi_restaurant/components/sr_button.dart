import 'package:flutter/material.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';
import 'package:ui_dairy/sdk/constants/spacing.dart';

class SRButton extends StatelessWidget {
  final String text;
  final Function onTap;
  const SRButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(Dimens.marginExtra),
        decoration: BoxDecoration(
          color: const Color.fromARGB(212, 135, 81, 77),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 17),
            ),
            Spacing.hXMedium,
            const Icon(
              Icons.arrow_forward,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
