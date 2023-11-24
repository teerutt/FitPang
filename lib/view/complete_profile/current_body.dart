import 'package:fitpang/view/complete_profile/what_your_goal_view.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/round_button.dart';

import 'package:carousel_slider/carousel_slider.dart';

class CurrentBody extends StatefulWidget {
  const CurrentBody({super.key});

  @override
  State<CurrentBody> createState() => _CurrentBodyState();
}

class _CurrentBodyState extends State<CurrentBody> {
  // final List<String> imgList = [
  //   '/assets/img/muscle.png',
  //   '/assets/img/weight.png',
  //   '/assets/img/height.png',
  //   '/assets/img/height.png',
  //   '/assets/img/height.png',
  // ];
  CarouselController buttonCarouselController = CarouselController();

  List bodyArr = [
    {
      "image": "assets/img/current_body1.png",
      "title": "10%-15%",
      "subtitle":
          "I have a low amount of body fat\nand need / want to build more\nmuscle",
    },
    {
      "image": "assets/img/current_body2.png",
      "title": "Lean & Tone",
      "subtitle":
          "I’m “skinny fat”. look thin but have\nno shape. I want to add learn\nmuscle in the right way"
    },
    {
      "image": "assets/img/current_body3.png",
      "title": "Lean & Tone",
      "subtitle":
          "I’m “skinny fat”. look thin but have\nno shape. I want to add learn\nmuscle in the right way"
    },

  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Text(
                    "What's your current\nbody shape",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: TColor.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // !!! Carousel Slider !!!
                  Center(
                    child: CarouselSlider(
                      options: CarouselOptions(height: 150.0),
                      items: bodyArr.map((bObj) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              margin: EdgeInsets.symmetric(horizontal: 2.0),
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
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    )
                    // child: CarouselSlider(
                    //   items: bodyArr
                    //       .map(
                    //         (gObj) => Container(
                    //           // decoration: BoxDecoration(
                    //           //   gradient: LinearGradient(
                    //           //       colors: TColor.primaryG,
                    //           //       begin: Alignment.topLeft,
                    //           //       end: Alignment.bottomRight),
                    //           //   borderRadius: BorderRadius.circular(25),
                    //           // ),
                    //           // padding: EdgeInsets.symmetric(
                    //           //     vertical: media.width * 0.1, horizontal: 25),
                    //           alignment: Alignment.center,
                    //           child: FittedBox(
                    //             child: Column(
                    //               children: [
                    //                 Image.asset(
                    //                   gObj["image"].toString(),
                    //                   width: media.width * 0.5,
                    //                   fit: BoxFit.fitWidth,
                    //                 ),
                    //                 // SizedBox(
                    //                 //   height: media.width * 0.1,
                    //                 // ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       )
                    //       .toList(),
                    //   carouselController: buttonCarouselController,
                    //   options: CarouselOptions(
                    //     autoPlay: false,
                    //     enlargeCenterPage: true,
                    //     viewportFraction: 0.2,
                    //     aspectRatio: 0.3,
                    //     initialPage: 0,
                    //   ),
                    // ),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You Estimated Body Fat(Approx.)",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // !!! Percentage (white box) !!!
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
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "10% - 15% (Ideal)",
                            style: TextStyle(
                              color: Colors.green[600],
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Flexible(
                            child: Text(
                              "Your figure is almost perfect! Keep it up!",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
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
                          builder: (context) => const WhatYourGoalView(),
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
