import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_dairy/projects/sushi_restaurant/sr_menu_page.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';

class SRFoodTile extends StatelessWidget {
  final Food food;
  const SRFoodTile(this.food, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: Dimens.marginExtra),
      padding: const EdgeInsets.all(Dimens.marginExtra),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            food.imagePath,
            height: 140,
          ),
          Text(
            food.name,
            style: GoogleFonts.dmSerifDisplay(color: Colors.grey[900], fontSize: 20),
          ),
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${food.price}",
                  style: TextStyle(color: Colors.grey[800], fontSize: 14),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      size: 15,
                      color: Colors.amber,
                    ),
                    Text(
                      food.rating,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
