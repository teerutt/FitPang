import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/round_button.dart';
import 'package:fitpang/common_widget/age_scrollwheel.dart';
import 'package:fitpang/view/complete_profile/height_view.dart';
import 'package:fitpang/view/maintab/maintab_view.dart';

class AgeView extends StatefulWidget {
  final int userId;
  final String gender;
  const AgeView({super.key,required this.userId,required this.gender});

  @override
  State<AgeView> createState() => _AgeViewState();
}

class _AgeViewState extends State<AgeView> {
  int selectedAge = 0;

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
                child: AgeScrollWheel(
                onAgeSelected: (age){
                  setState(() {
                    selectedAge = age;
                  });
                },),
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
                  color: Colors.grey,
                ),
                padding: const EdgeInsets.all(0.25),
                child: IconButton(
                  icon: Icon(Icons.home_outlined),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => MainTabView(
                            userId: widget
                                .userId),
                      ),
                    );
                  },
                  color: Colors.white, 
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
                    "How old are you ?",
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
                        print('Selected Age: $selectedAge');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HeightView(userId: widget.userId, gender: widget.gender, age: selectedAge,))
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
