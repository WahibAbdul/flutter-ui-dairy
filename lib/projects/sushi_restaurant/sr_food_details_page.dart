import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_dairy/projects/sushi_restaurant/components/sr_button.dart';
import 'package:ui_dairy/projects/sushi_restaurant/components/sr_quantity_counter.dart';
import 'package:ui_dairy/projects/sushi_restaurant/sr_menu_page.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';
import 'package:ui_dairy/sdk/constants/spacing.dart';

class SRFoodDetailsPage extends StatefulWidget {
  final Food food;
  const SRFoodDetailsPage(this.food, {super.key});

  @override
  State<SRFoodDetailsPage> createState() => _SRFoodDetailsPageState();
}

class _SRFoodDetailsPageState extends State<SRFoodDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0.0,
        elevation: 0.0,
        // foregroundColor: Colors.grey[900],
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: Dimens.marginExtra),
            children: [
              Image.asset(
                widget.food.imagePath,
                height: 230,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.amber,
                  ),
                  Spacing.hMedium,
                  Text(
                    widget.food.rating,
                    style: TextStyle(fontSize: 15, color: Colors.grey[600], fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Spacing.vExtra,
              Text(
                widget.food.name,
                style: GoogleFonts.dmSerifDisplay(color: Colors.grey[900], fontSize: 30),
              ),
              Spacing.vExtra,
              Text(
                "Description",
                style: TextStyle(color: Colors.grey[800], fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Spacing.vXMedium,
              Text(
                getDescriptionText(),
                style: TextStyle(color: Colors.grey[600], fontSize: 15, height: 2),
              ),
              Spacing.vXMedium,
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(Dimens.marginExtra),
          decoration: const BoxDecoration(color: Color.fromARGB(255, 138, 60, 55)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${widget.food.price}",
                    style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SRQuantityCounter(
                    onQuantityChanged: (quantity) {},
                  )
                ],
              ),
              Spacing.vExtra,
              SRButton(text: "Add To Cart", onTap: () {}),
            ],
          ),
        )
      ],
    );
  }

  String getDescriptionText() {
    return "Salmon sushi is often eaten as nigiri. A ball of shaped, vinegared sushi rice is topped with a delicious looking slice of salmon. You can then dip this in soy sauce, or with wasabi and soy sauce, or alternatively salt and a bit of citrus. In homage to how salmon used to be eaten it can still be ordered grilled too.";
  }
}
