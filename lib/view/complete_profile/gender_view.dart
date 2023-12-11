import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';

import 'package:fitpang/common_widget/round_button.dart';
import 'package:fitpang/common_widget/gender_button.dart';
import 'package:fitpang/view/complete_profile/age_view.dart';

class GenderView extends StatefulWidget {
  final int userId;
  const GenderView({super.key, required this.userId});

  @override
  State<GenderView> createState() => _GenderViewState();
}

class _GenderViewState extends State<GenderView> {
  int selectTab = 0;

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GenderButton(
                      label: "Male",
                      icon: "assets/img/male.png",
                      selectedIcon: "assets/img/male_selected.png",
                      isActive: selectTab == 0,
                      onTap: () {
                        selectTab = 0;
                        if (mounted) {
                          setState(() {});
                        }
                      }),
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                  GenderButton(
                      label: "Female",
                      icon: "assets/img/female.png",
                      selectedIcon: "assets/img/female_selected.png",
                      isActive: selectTab == 1,
                      onTap: () {
                        selectTab = 1;
                        if (mounted) {
                          setState(() {});
                        }
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                padding: const EdgeInsets.all(0.25),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.of(context).pop();
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
                    "Tell us about yourself!",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "To give you a better experience\nwe need to know your gender",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: TColor.gray, fontSize: 12),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  RoundButton(
                    title: "Next >",
                    onPressed: () {
                      String gender = "Male";
                      if (selectTab == 1)
                      {
                        gender = "Female";
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgeView(userId: widget.userId, gender: gender,)
                        ),
                      );
                    }
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
