import 'package:flutter/material.dart';
import 'package:ui_dairy/projects/coffee_shop_plain/models/csp_coffee_model.dart';

class CSPShop extends ChangeNotifier {
  final List<CSPCoffee> _shop = [
    CSPCoffee(name: "Black", price: "4.10", imagePath: "lib/images/coffee_plain_black.png"),
    CSPCoffee(name: "Expresso", price: "5.00", imagePath: "lib/images/coffee_plain_espresso.png"),
    CSPCoffee(name: "Iced Coffee", price: "3.50", imagePath: "lib/images/coffee_plain_iced_coffee.png"),
    CSPCoffee(name: "Latte", price: "4.50", imagePath: "lib/images/coffee_plain_latte.png"),
  ];

  final List<CSPCoffee> _cart = [];

  List<CSPCoffee> get coffeeShop => _shop;
  List<CSPCoffee> get userCart => _cart;

  addItemToCart(CSPCoffee coffee) {
    _cart.add(coffee);
    notifyListeners();
  }

  removeItemFromCart(CSPCoffee coffee) {
    _cart.remove(coffee);
    notifyListeners();
  }
}
