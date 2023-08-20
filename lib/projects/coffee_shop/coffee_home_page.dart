import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_dairy/projects/coffee_shop/coffee_app_constants.dart';
import 'package:ui_dairy/projects/coffee_shop/coffee_detail_page.dart';
import 'package:ui_dairy/projects/coffee_shop/components/coffee_dark_icon_button.dart';
import 'package:ui_dairy/projects/coffee_shop/components/coffee_menu_tile.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';
import 'package:ui_dairy/sdk/constants/spacing.dart';
import 'package:ui_dairy/sdk/utils/navigation_utils.dart';
import 'package:ui_dairy/sdk/widgets/circular_tab_indicator.dart';

class CoffeeHomePage extends StatefulWidget {
  const CoffeeHomePage({super.key});

  @override
  State<CoffeeHomePage> createState() => _CoffeeHomePageState();
}

class _CoffeeHomePageState extends State<CoffeeHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoffeeAppConstants.backgroundColor,
      bottomNavigationBar: _buildBottomNavigation(context),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.marginExtra),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacing.vMedium,
              // App bar
              _buildAppBar(context),
              // Search bar
              Spacing.vExtra,
              Text(
                "Find the best\ncoffee for you",
                style: GoogleFonts.bebasNeue(
                  fontSize: 45,
                  color: Colors.white,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Spacing.vLarge,
              _buildSearchBar(context),
              Spacing.vLarge,
              // Tab bar
              _buildTabBar(context),
              // Menu Items
              Spacing.vLarge,
              _buildMenuItems(context),
              // Special For You
              Spacing.vExtra,
              Text(
                "Special for you",
                style: GoogleFonts.bebasNeue(
                  fontSize: 25,
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Spacing.vertical,
              _buildSpecialForYou(context),
              Spacing.vertical,
            ],
          ),
        ),
      ),
    );
  }

  _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CoffeeDarkIconButton(icon: Icons.menu),
        Container(
          width: 50,
          height: 50,
          padding: const EdgeInsets.all(Dimens.marginXSmall),
          decoration: BoxDecoration(
            gradient: CoffeeAppConstants.gradientBackground(),
            borderRadius: BorderRadius.circular(CoffeeAppConstants.buttonRadius),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(CoffeeAppConstants.buttonRadius),
            child: Image.asset(
              "lib/images/profile_picture.png",
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }

  _buildBottomNavigation(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: CoffeeAppConstants.backgroundColor,
      selectedItemColor: CoffeeAppConstants.secondaryColor,
      unselectedItemColor: CoffeeAppConstants.secondaryTextColor,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
      ],
    );
  }

  _buildSearchBar(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        contentPadding: const EdgeInsets.all(Dimens.margin),
        isDense: false,
        fillColor: CoffeeAppConstants.grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(CoffeeAppConstants.buttonRadius),
          borderSide: BorderSide.none,
        ),
        hintText: "Find Your Coffee...",
        hintStyle: TextStyle(color: CoffeeAppConstants.secondaryTextColor),
        prefixIcon: const Icon(Icons.search),
      ),
    );
  }

  _buildTabBar(BuildContext context) {
    return TabBar(
      controller: _tabController,
      unselectedLabelColor: CoffeeAppConstants.secondaryTextColor,
      labelColor: CoffeeAppConstants.secondaryColor,
      indicator: CircularTabIndicator(CoffeeAppConstants.secondaryColor),
      dividerColor: Colors.transparent,
      isScrollable: true,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      labelStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      tabs: const [
        Tab(text: "Cappuccino"),
        Tab(text: "Espresso"),
        Tab(text: "Latte"),
        Tab(text: "Flat White"),
        Tab(text: "Cappuccino"),
      ],
    );
  }

  final menu = [
    Coffee("Cappuccino", "Oat Milk", "4.20", "4.5", "lib/images/coffee_cappucino.jpg"),
    Coffee("Latte", "Chocolate", "5.00", "4.3", "lib/images/coffee_latte.jpg"),
    Coffee("Tea", "Milk", "2.20", "4.7", "lib/images/coffee_milk.jpg"),
  ];
  _buildMenuItems(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: menu.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(getPageRoute((context) => CoffeeDetailPage(menu[index])));
            },
            child: CoffeeMenuTile(menu[index]),
          );
        },
      ),
    );
  }

  _buildSpecialForYou(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimens.marginXMedium),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(CoffeeAppConstants.cardRadius),
        gradient: CoffeeAppConstants.gradientBackground(),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(CoffeeAppConstants.cardRadius),
            child: Image.asset(
              "lib/images/coffee_latte.jpg",
              fit: BoxFit.cover,
              width: 150,
              height: 150,
              // height: ,
            ),
          ),
          Spacing.hExtra,
          const Expanded(
            child: Column(
              children: [
                Text(
                  "5 Coffee Beans You Must Try!",
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Coffee {
  final String name;
  final String extra;
  final String price;
  final String rating;
  final String imagePath;

  Coffee(this.name, this.extra, this.price, this.rating, this.imagePath);
}
