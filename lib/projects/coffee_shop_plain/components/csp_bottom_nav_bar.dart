import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';

class CSPBottomNavBar extends StatelessWidget {
  final Function(int) onTabChange;
  const CSPBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(Dimens.marginExtra),
      child: GNav(
        onTabChange: (value) => onTabChange(value),
        mainAxisAlignment: MainAxisAlignment.center,
        color: Colors.grey[400],
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade300,
        tabActiveBorder: Border.all(color: Colors.grey.shade700),
        tabBorderRadius: 24,
        tabs: const [
          GButton(icon: Icons.home, text: "Shop"),
          GButton(icon: Icons.shopping_bag_outlined, text: "Cart"),
        ],
      ),
    );
  }
}
