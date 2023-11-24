import 'package:fitpang/view/complete_profile/desired_body.dart';
import 'package:fitpang/view/complete_profile/what_your_goal_view.dart';
import 'package:fitpang/view/homedashboard/blank_view.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/round_button.dart';

import 'package:carousel_slider/carousel_slider.dart';

class CurrentBody extends StatefulWidget {
  final int userId;
  final String gender;
  final int age;
  final int height;
  final int weight;
  const CurrentBody({super.key, required this.userId, required this.gender, required this.age, required this.height, required this.weight});

  @override
  State<CurrentBody> createState() => _CurrentBodyState();
}

class _CurrentBodyState extends State<CurrentBody> {
  CarouselController buttonCarouselController = CarouselController();

  List bodyArr = [
    {
      "image": "assets/img/current_body1.png",
      "title": "10-15%",
    },
    {
      "image": "assets/img/current_body2.png",
      "title": "16-25%",
    },
    {
      "image": "assets/img/current_body3.png",
      "title": "26-35%",
    },

  ];

  @override
  Widget build(BuildContext context) {
    int selectedCurrbody = 0;

    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 20,
              left: 15,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                  Text(
                    "What's your current\nbody shape",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: TColor.black),
                  ),
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                  // !!! Carousel Slider !!!
                  Center(
                    child: CarouselSlider(
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        height: media.height * 0.4,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        viewportFraction: 0.7,
                        aspectRatio: 0.74,
                        initialPage: 0,
                        onPageChanged: (index, reason) {
                          selectedCurrbody = index;
                          setState((){});
                        },
                      ),
                      items: bodyArr.map((bObj) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              margin: const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                color: TColor.white,
                                border: Border.all(
                                  color: TColor.primaryColor1,
                                  width: 5.0,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: FittedBox(
                                child: Image.asset(
                                  bObj["image"].toString(),
                                  // width: media.width * 0.5,
                                  // height: media.width * 0.5,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    )
                  ),
                  SizedBox(
                    height: media.width * 0.1,
                  ),


                  // !!! Estimated Body Fat (grey box) !!!
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: 330,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "You Estimated Body Fat(Approx.)",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: 330,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // *** query bodyArr["title"] ***
                          "10% - 15% (Ideal)",
                          style: TextStyle(
                            color: Colors.green[600],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const Text(
                          "Your figure is almost perfect! Keep it up!",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // !!! Confirm Button !!!
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: RoundButton(
                    title: "Next >",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlankView(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
