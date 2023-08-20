import 'package:flutter/material.dart';
import 'package:ui_dairy/projects/sushi_restaurant/components/sr_button.dart';
import 'package:ui_dairy/sdk/constants/dimens.dart';

class SRCartPage extends StatefulWidget {
  const SRCartPage({super.key});

  @override
  State<SRCartPage> createState() => _SRCartPageState();
}

class _SRCartPageState extends State<SRCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 138, 60, 55),
      appBar: AppBar(
        title: const Text("My Cart"),
        backgroundColor: const Color.fromARGB(255, 138, 60, 55),
        foregroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              padding: const EdgeInsets.symmetric(horizontal: Dimens.margin),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(top: Dimens.margin),
                  padding: const EdgeInsets.all(Dimens.margin),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(212, 135, 81, 77),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Salmon Sushi",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "\$21.00",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ))
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Dimens.margin),
            child: SRButton(text: "Pay Now", onTap: () {}),
          )
        ],
      ),
    );
  }
}
