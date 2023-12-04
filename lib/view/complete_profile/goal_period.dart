import 'package:fitpang/view/complete_profile/complete_create.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/round_button.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitpang/view/login/welcome_view.dart';

class GoalPeriod extends StatefulWidget {
  final int userId;
  final String gender;
  final int age;
  final int height;
  final int weight;
  final String goal;
  final int current_body;
  final int desired_body;
  const GoalPeriod(
      {super.key,
      required this.userId,
      required this.gender,
      required this.age,
      required this.height,
      required this.weight,
      required this.goal,
      required this.current_body,
      required this.desired_body});

  @override
  State<GoalPeriod> createState() => _GoalPeriodState();
}

class _GoalPeriodState extends State<GoalPeriod> {
  int _current = 0;
  CarouselController buttonCarouselController = CarouselController();

  List periodArr = [
    {
      "image": "assets/img/period_month_hard.png",
      "title": "2 months",
      "suggestion": "This level is a hard level.",
      "tag": "0"
    },
    {
      "image": "assets/img/period_month_medium.png",
      "title": "4 months",
      "suggestion": "This level is a medium level.",
      "tag": "1"
    },
    {
      "image": "assets/img/period_month_medium.png",
      "title": "6 months",
      "suggestion": "This level is a medium level.",
      "tag": "2"
    },
    {
      "image": "assets/img/period_month_easy.png",
      "title": "8 months",
      "suggestion": "This level is a easy level.",
      "tag": "3"
    },
    {
      "image": "assets/img/period_month_easy.png",
      "title": "10 months",
      "suggestion": "This level is a easy level.",
      "tag": "4"
    }
  ];

  @override
  Widget build(BuildContext context) {
    String current_body_path =
        'assets/img/current_body' + '${widget.current_body + 1}' + '.png';
    String desired_body_path =
        'assets/img/desired_body' + '${widget.desired_body + 1}' + '.png';

    switch (widget.desired_body) {
          case 0:
            for (int i = 0; i < 4; i++) {
              periodArr[i]['suggestion'] = 'Sorry, This level is impossible.\nTry choosing a longer period.';
              periodArr[i]['tag'] = '-1';
            }
          case 1:
            for (int i = 0; i < 3; i++) {
              periodArr[i]['suggestion'] = 'Sorry, This level is impossible.\nTry choosing a longer period.';
              periodArr[i]['tag'] = '-1';
            }
          case 2:
            for (int i = 0; i < 2; i++) {
              periodArr[i]['suggestion'] = 'Sorry, This level is impossible.\nTry choosing a longer period.';
              periodArr[i]['tag'] = '-1';
            }
          case 3:
            for (int i = 0; i < 1; i++) {
              periodArr[i]['suggestion'] = 'Sorry, This level is impossible.\nTry choosing a longer period.';
              periodArr[i]['tag'] = '-1';
            }
          case 4:
        }

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
                    "How fast  do you want to\nreach your goal ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: TColor.black),
                  ),
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Your\nbody",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: media.width * 0.07,
                          ),
                          Container(
                            width: media.width * 0.3,
                            height: media.width * 0.25,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: TColor.gray,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            child: Image.asset(
                              current_body_path,
                              // fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                      Image.asset("assets/img/right_arrow.png"),
                      Column(
                        children: [
                          const Text(
                            "Target\nbody",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: media.width * 0.07,
                          ),
                          Container(
                            width: media.width * 0.3,
                            height: media.width * 0.25,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: TColor.primaryColor1,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            child: Image.asset(
                              desired_body_path,
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                      // RichText(
                      //   text: TextSpan(
                      //     children: [
                      //       TextSpan(
                      //         text: "Target\n",
                      //         style: TextStyle(
                      //           color: TColor.primaryColor1,
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.w700,
                      //         ),
                      //       ),
                      //       TextSpan(
                      //         text: "body",
                      //         style: TextStyle(
                      //           color: TColor.black,
                      //           fontSize: 28,
                      //           fontWeight: FontWeight.w700,
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Column(
                      //   children: [
                      //     Text(
                      //       "Target\nbody",
                      //       style: TextStyle(
                      //         fontSize: 20,
                      //         fontWeight: FontWeight.w700
                      //       ),
                      //       textAlign: TextAlign.center,
                      //     ),
                      //     // Additional content for "Target body" if needed
                      //   ],
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                  // !!! Carousel Slider !!!
                  Center(
                      child: CarouselSlider(
                    carouselController: buttonCarouselController,
                    options: CarouselOptions(
                      height: media.height * 0.1,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      viewportFraction: 0.9,
                      aspectRatio: 0.74,
                      initialPage: 0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    items: periodArr.map((bObj) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                bObj["image"].toString(),
                                fit: BoxFit.none,
                              ),
                              SizedBox(
                                width: media.width * 0.03,
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "You selected ${periodArr[_current]["title"]}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      "${periodArr[_current]["suggestion"]}",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700,
                                          color: TColor.gray),
                                    )
                                  ]),
                            ],
                            // child: Image.asset(
                            //   bObj["image"].toString(),
                            //   // width: media.width * 0.5,
                            //   // height: media.width * 0.5,
                            //   fit: BoxFit.fill,
                            // ),
                          );
                        },
                      );
                    }).toList(),
                  )),
                  SizedBox(
                    height: media.width * 0.15,
                  ),
                  // Carousel Indicators
                  Positioned(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: periodArr.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              buttonCarouselController.animateToPage(entry.key),
                          child: Container(
                            width: 30.0,
                            height: 15.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(
                                      _current == entry.key ? 0.9 : 0.4),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  SizedBox(
                    height: media.width * 0.1,
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
                  child: IgnorePointer(
                    ignoring: periodArr[_current]["tag"] == '-1',
                    child: Opacity(
                      opacity: periodArr[_current]["tag"] == '-1' ? 0.5 : 1.0,
                      child: RoundButton(
                        title: "Next >",
                        onPressed: () {
                          int period = (_current+1)*2;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CompleteCreate(userId: widget.userId, gender: widget.gender, weight: widget.weight, height: widget.height, age: widget.age, goal: widget.goal, current_body: widget.current_body, desired_body: widget.desired_body, period: period,),
                            ),
                          );
                        },
                      ),
                    ),
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
