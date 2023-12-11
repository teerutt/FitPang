import 'package:fitpang/common_widget/weight_scrollwhell.dart';
import 'package:fitpang/view/complete_profile/bmi_score.dart';
import 'package:fitpang/view/maintab/maintab_view.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';

import 'package:fitpang/common_widget/round_button.dart';

class WeightView extends StatefulWidget {
  final int userId;
  final String gender;
  final int age;
  final int height;
  const WeightView(
      {super.key,
      required this.userId,
      required this.gender,
      required this.age,
      required this.height});

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
                  onWeightSelected: (weight) {
                    setState(() {
                      selectedWeight = weight;
                    });
                  },
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
            const Spacer(),
            SizedBox(
              height: media.width * 0.05,
            ),
            Positioned(
              left: media.width * 0.6, // 30% from the left
              top: media.height * 0.45,
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
                    "You have to update weekly",
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
                      print(
                          'userId: ${widget.userId}\n${widget.gender}\n${widget.age}\n${widget.height}\nSelected weight: $selectedWeight');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BMIScore(
                            userId: widget.userId,
                            gender: widget.gender,
                            age: widget.age,
                            height: widget.height,
                            weight: selectedWeight,
                          ),
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
