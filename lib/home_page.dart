import 'package:flutter/material.dart';
import 'package:ui_dairy/main.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final projects = [
    Menu("Sushi Restaurant", Routes.sushiRestaurant),
    Menu("Coffee Shop", Routes.coffeeApp),
    Menu("Coffee Shop Plain", Routes.coffeeShopPlainApp),
  ];

  final background = Colors.blueGrey;
  final foreground = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Dairy"),
        backgroundColor: background,
        foregroundColor: foreground,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(Dimens.margin, Dimens.margin, Dimens.margin, 0),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(projects[index].route);
          },
          child: Container(
            margin: const EdgeInsets.only(top: Dimens.margin),
            padding: const EdgeInsets.all(Dimens.margin),
            decoration: BoxDecoration(color: background[100], borderRadius: BorderRadius.circular(10)),
            child: Text(
              projects[index].title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        );
      },
    );
  }
}

class Menu {
  final String title;
  final String route;
  Menu(this.title, this.route);
}
