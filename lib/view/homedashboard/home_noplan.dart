import 'package:fitpang/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common_widget/round_button_create.dart';
import 'package:fitpang/view/complete_profile/age_view.dart';
import 'package:intl/intl.dart';

class HomeNoPlan extends StatefulWidget {
  const HomeNoPlan({super.key});

  @override
  State<HomeNoPlan> createState() => _HomeNoPlanState();
}

class _HomeNoPlanState extends State<HomeNoPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Column(
          children: [
            // Row 1
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Welcome Back, \nKlaeng",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat('d MMM yyyy').format(DateTime.now()),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Row(
                    children: [
                      Text(
                        "You don't have any plan",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                RoundButtonCreate(
                  title: "+ Create Plan",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AgeView()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
