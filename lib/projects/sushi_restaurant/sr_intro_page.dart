import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_dairy/projects/sushi_restaurant/components/sr_button.dart';
import 'package:ui_dairy/projects/sushi_restaurant/sr_menu_page.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';
import 'package:ui_dairy/sdk/constants/spacing.dart';
import 'package:ui_dairy/sdk/utils/navigation_utils.dart';

class SRIntroPage extends StatefulWidget {
  const SRIntroPage({super.key});

  @override
  State<SRIntroPage> createState() => _SRIntroPageState();
}

class _SRIntroPageState extends State<SRIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimens.marginLarge),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.vLarge,
          Text(
            "SUSHI MAN",
            style: GoogleFonts.dmSerifDisplay(fontSize: 28, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.all(Dimens.marginXLarge),
            child: Image.asset('lib/images/sr_sushi.png'),
          ),
          Spacing.vExtra,
          Text(
            "THE TASTE OF JAPANESE FOOD",
            style: GoogleFonts.dmSerifDisplay(fontSize: 44, color: Colors.white),
          ),
          Spacing.vExtra,
          Text(
            "Feel the taste of the most popular Japanese food from anywhere and anytime",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[300],
                  height: 2,
                ),
          ),
          Spacing.vExtra,
          SRButton(
            text: "Get Started",
            onTap: () {
              Navigator.of(context).push(getPageRoute((context) => const SRMenuPage()));
            },
          ),
        ],
      ),
    );
  }
}
