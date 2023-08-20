import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_dairy/projects/sushi_restaurant/components/sr_button.dart';
import 'package:ui_dairy/projects/sushi_restaurant/components/sr_food_tile.dart';
import 'package:ui_dairy/projects/sushi_restaurant/sr_cart_page.dart';
import 'package:ui_dairy/projects/sushi_restaurant/sr_food_details_page.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';
import 'package:ui_dairy/sdk/constants/spacing.dart';
import 'package:ui_dairy/sdk/utils/navigation_utils.dart';

class SRMenuPage extends StatefulWidget {
  const SRMenuPage({super.key});

  @override
  State<SRMenuPage> createState() => _SRMenuPageState();
}

class _SRMenuPageState extends State<SRMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.grey[900]),
        title: Text(
          'Tokyo',
          style: TextStyle(color: Colors.grey[900]),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(getPageRoute((context) => const SRCartPage()));
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    final foodMenu = [
      Food("Salmon Sushi", "21.00", "lib/images/sr_sushi2.png", "4.9"),
      Food("Tuna", "23.00", "lib/images/sr_sushi3.png", "4.3"),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Promo Banner
        Container(
          margin: const EdgeInsets.all(Dimens.marginExtra),
          padding: const EdgeInsets.all(Dimens.marginExtra),
          decoration:
              BoxDecoration(color: const Color.fromARGB(255, 138, 60, 55), borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get 32% Promo',
                    style: GoogleFonts.dmSerifDisplay(color: Colors.white, fontSize: 20),
                  ),
                  Spacing.vExtra,
                  SRButton(text: "Redeem", onTap: () {}),
                ],
              ),
              Image.asset(
                'lib/images/sr_sushi1.png',
                height: 100,
              )
            ],
          ),
        ),

        // Search Bar
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.marginExtra),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              hintText: 'Search Here...',
              hintStyle: TextStyle(color: Colors.grey[500]),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.circular(20),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
        Spacing.vExtra,

        // Menu List
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.marginExtra),
          child: Text(
            "Food Menu",
            style: TextStyle(fontSize: 18, color: Colors.grey[800], fontWeight: FontWeight.bold),
          ),
        ),
        Spacing.vExtra,
        Expanded(
          child: ListView.builder(
            itemCount: foodMenu.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(getPageRoute((context) => SRFoodDetailsPage(foodMenu[index])));
                  },
                  child: SRFoodTile(foodMenu[index]));
            },
          ),
        ),

        // Popular Food
        Container(
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.all(Dimens.marginExtra),
          padding: const EdgeInsets.all(Dimens.marginExtra),
          child: Row(
            children: [
              Image.asset('lib/images/sr_sushi.png', height: 50),
              Spacing.hExtra,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Salmon Eggs",
                      style: GoogleFonts.dmSerifDisplay(fontSize: 18, color: Colors.grey[800]),
                    ),
                    Spacing.vMedium,
                    Text(
                      "\$21.00",
                      style: TextStyle(color: Colors.grey[700]),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Food {
  String name;
  String price;
  String imagePath;
  String rating;
  Food(
    this.name,
    this.price,
    this.imagePath,
    this.rating,
  );
}
