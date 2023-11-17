import 'package:fitpang/common_widget/height_scrollwheel.dart';
import 'package:fitpang/view/complete_profile/weight_view.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';

import 'package:fitpang/common_widget/round_button.dart';

class HeightView extends StatefulWidget {
  final int userId;
  final String gender;
  final int age;
  const HeightView({super.key, required this.userId, required this.gender, required this.age});

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
            Center(
              child: HeightScrollwhell(
                onHeightSelected: (height){
                  setState(() {
                    selectedHeight = height;
                  });
                },
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
                              builder: (context) => WeightView(userId: widget.userId, gender: widget.gender, age: widget.age, height: selectedHeight,)),
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
