import 'package:fitpang/common_widget/weight_scrollwhell.dart';
import 'package:fitpang/view/complete_profile/what_your_goal_view.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';

import 'package:fitpang/common_widget/round_button.dart';

class WeightView extends StatefulWidget {
  final int userId;
  final String gender;
  final int age;
  final int height;
  const WeightView({super.key, required this.userId, required this.gender, required this.age, required this.height});

  @override
  State<WeightView> createState() => _WeightViewState();
}

class _WeightViewState extends State<WeightView> {
  int selectedWeight = 0;
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Center(
                child: WeightScrollWhell(
                  onWeightSelected: (weight){
                  setState(() {
                    selectedWeight = weight;
                  });
                },
              ),
            ),
          ),
            Positioned(
              bottom: 105,
              left: 15,
              right: 15, 
              child: ClipRRect(
                // Wrap the container with ClipRRect
                borderRadius: BorderRadius.circular(20.0),
                child: Container(
                  color: TColor.lightenGray, // Set your desired background color
                  // padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: media.width * 0.02,
                      ),
                      Text(
                        "Current BMI (Normal)",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "19.8",
                              style: TextStyle(
                                color: Colors.greenAccent[400],
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(width: 20),
                            Flexible(
                                child: Text(
                              "You've got a great figure! Keep it up!",
                              style: TextStyle(
                                color: TColor.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: media.width * 0.05,
            ),
            Positioned(
              left: 240,
              top: 420,
              child: Text(
                "kg",
                style: TextStyle(
                  color: TColor.midGray,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
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
                      
                      print('userId: ${widget.userId}\n${widget.gender}\n${widget.age}\n${widget.height}\nSelected weight: $selectedWeight');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WhatYourGoalView(),
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
