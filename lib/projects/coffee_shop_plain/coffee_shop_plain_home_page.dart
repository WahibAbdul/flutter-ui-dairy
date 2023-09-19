import 'package:flutter/material.dart';
import 'package:ui_dairy/projects/coffee_shop_plain/components/csp_bottom_nav_bar.dart';
import 'package:ui_dairy/projects/coffee_shop_plain/csp_cart_page.dart';
import 'package:ui_dairy/projects/coffee_shop_plain/csp_shop_page.dart';

class CoffeeShopPlainHomePage extends StatefulWidget {
  const CoffeeShopPlainHomePage({super.key});

  @override
  State<CoffeeShopPlainHomePage> createState() => _CoffeeShopPlainHomePageState();
}

class _CoffeeShopPlainHomePageState extends State<CoffeeShopPlainHomePage> {
  var _selectedTabIndex = 0;

  final _pages = [
    const CSPShopPage(),
    const CSPCartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: CSPBottomNavBar(
        onTabChange: (index) {
          navigateBottomBar(index);
        },
      ),
      body: _pages[_selectedTabIndex],
    );
  }

  navigateBottomBar(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }
}
