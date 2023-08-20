import 'package:flutter/material.dart';
import 'package:ui_dairy/home_page.dart';
import 'package:ui_dairy/projects/coffee_shop/coffee_home_page.dart';
import 'package:ui_dairy/projects/sushi_restaurant/sr_intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI Dairy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
      routes: {
        Routes.sushiRestaurant: (context) => const SRIntroPage(),
        Routes.coffeeApp: (context) => const CoffeeHomePage(),
      },
    );
  }
}

abstract class Routes {
  static const sushiRestaurant = "/sushiRestaurant";
  static const coffeeApp = "/coffeeApp";
  static const groceryShopApp = "/groceryShopApp";
}
