import 'package:fitpang/view/complete_profile/what_your_goal_view.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/round_button.dart';

class CurrentBody extends StatefulWidget {
  const CurrentBody({super.key});

  @override
  State<CurrentBody> createState() => _CurrentBodyState();
}

class _CurrentBodyState extends State<CurrentBody> {
  final List<String> imgList = [
    '/assets/img/muscle.png',
    '/assets/img/weight.png',
    '/assets/img/height.png',
    '/assets/img/height.png',
    '/assets/img/height.png',
  ];

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    "What's your current\nbody shape",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: TColor.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Builder(
                  //   builder: (context) {
                  //     final double height = MediaQuery.of(context).size.height;
                  //     Center(
                  //       child: CarouselSlider(
                  //         items: goalArr
                  //             .map(
                  //               (gObj) => Container(
                  //                 decoration: BoxDecoration(
                  //                   gradient: LinearGradient(
                  //                       colors: TColor.primaryG,
                  //                       begin: Alignment.topLeft,
                  //                       end: Alignment.bottomRight),
                  //                   borderRadius: BorderRadius.circular(25),
                  //                 ),
                  //                 padding: EdgeInsets.symmetric(
                  //                     vertical: media.width * 0.1,
                  //                     horizontal: 25),
                  //                 alignment: Alignment.center,
                  //                 child: FittedBox(
                  //                   child: Column(
                  //                     children: [
                  //                       Image.asset(
                  //                         gObj["image"].toString(),
                  //                         width: media.width * 0.5,
                  //                         fit: BoxFit.fitWidth,
                  //                       ),
                  //                       SizedBox(
                  //                         height: media.width * 0.1,
                  //                       ),
                  //                       Text(
                  //                         gObj["title"].toString(),
                  //                         style: TextStyle(
                  //                             color: TColor.white,
                  //                             fontSize: 14,
                  //                             fontWeight: FontWeight.w700),
                  //                       ),
                  //                       Container(
                  //                         width: media.width * 0.1,
                  //                         height: 1,
                  //                         color: TColor.white,
                  //                       ),
                  //                       SizedBox(
                  //                         height: media.width * 0.02,
                  //                       ),
                  //                       Text(
                  //                         gObj["subtitle"].toString(),
                  //                         textAlign: TextAlign.center,
                  //                         style: TextStyle(
                  //                             color: TColor.white,
                  //                             fontSize: 12),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ),
                  //             )
                  //             .toList(),
                  //         carouselController: buttonCarouselController,
                  //         options: CarouselOptions(
                  //           autoPlay: false,
                  //           enlargeCenterPage: true,
                  //           viewportFraction: 0.7,
                  //           aspectRatio: 0.74,
                  //           initialPage: 0,
                  //         ),
                  //       ),
                  //     ),

                  // CarouselSlider(
                  //   options: CarouselOptions(
                  //     height: height,
                  //     viewportFraction: 1.0,
                  //     enlargeCenterPage: false,
                  //     // autoPlay: false,
                  //   ),
                  //   items: imgList
                  //       .map(
                  //         (item) => Center(
                  //             child: Image.network(
                  //           item,
                  //           fit: BoxFit.cover,
                  //           height: height,
                  //         )),
                  //       )
                  //       .toList(),
                  // );
                  //   },
                  // ),
                  // !!! Your Estimated Body Fat (grey box) !!!
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
                    title: "Confirm",
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
