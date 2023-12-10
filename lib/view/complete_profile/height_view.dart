import 'package:fitpang/common_widget/height_scrollwheel.dart';
import 'package:fitpang/view/complete_profile/weight_view.dart';
import 'package:fitpang/view/homedashboard/home_noplan.dart';
import 'package:fitpang/view/maintab/maintab_view.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';

import 'package:fitpang/common_widget/round_button.dart';

class HeightView extends StatefulWidget {
  final int userId;
  final String gender;
  final int age;
  const HeightView(
      {super.key,
      required this.userId,
      required this.gender,
      required this.age});

  @override
  State<HeightView> createState() => _HeightViewState();
}

class _HeightViewState extends State<HeightView> {
  int selectedHeight = 0;

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
              padding: EdgeInsets.only(bottom: 12.0),
              child: Center(
                child: HeightScrollwhell(
                  onHeightSelected: (height) {
                    setState(() {
                      selectedHeight = height;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              left: media.width * 0.6, // 30% from the left
              top: media.height * 0.45, // 50% from the top
              child: Text(
                "cm",
                style: TextStyle(
                  color: TColor.midGray,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey, // Background color of the circle
                ),
                padding: const EdgeInsets.all(0.25),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.white, // Icon color
                ),
              ),
            ),
            Positioned(
              right: 15.0,
              top: 15.0,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey, // Background color of the circle
                ),
                padding: const EdgeInsets.all(0.25),
                child: IconButton(
                  icon: Icon(Icons.home_outlined),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => MainTabView(
                            userId: widget
                                .userId), // Replace 'YourHomePage()' with the actual class for your main home page
                      ),
                    );
                  },
                  color: Colors.white, // Icon color
                ),
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
                    "What's your height ?",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "This helps us create your personalized plan",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: TColor.gray, fontSize: 12),
                  ),
                  const Spacer(),
                  Image.asset(
                    "assets/img/border_line.png",
                  ),
                  SizedBox(
                    height: media.width * 0.15,
                  ),
                  Image.asset(
                    "assets/img/border_line.png",
                  ),
                  const Spacer(),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  RoundButton(
                      title: "Next >",
                      onPressed: () {
                        print('Selected Height: $selectedHeight');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WeightView(
                                    userId: widget.userId,
                                    gender: widget.gender,
                                    age: widget.age,
                                    height: selectedHeight,
                                  )),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
