import 'package:fitpang/common_widget/weight_scrollwhell.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';

import 'package:fitpang/common_widget/round_button.dart';
import 'package:fitpang/view/login/welcome_view.dart';

class WeightView extends StatefulWidget {
  const WeightView({super.key});

  @override
  State<WeightView> createState() => _WeightViewState();
}

class _WeightViewState extends State<WeightView> {
  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: const Center(
                child: WeightScrollWhell(),
              ),
            ),
            const Positioned(
              bottom: 85, // Adjust the position as needed
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    "Current BMI (Normal)",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "19.8",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "You've got a great figure! \nKeep it up!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
              width: media.width,
              child: Column(
                children: [
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Text(
                    "What's your weight ?",
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "You can always change later",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: TColor.gray, fontSize: 12),
                  ),
                  const Spacer(),
                  Image.asset("assets/img/border_line.png"),
                  SizedBox(
                    height: media.width * 0.15,
                  ),
                  Image.asset("assets/img/border_line.png"),
                  const Spacer(),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  RoundButton(
                    title: "Next >",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WelcomeView(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
