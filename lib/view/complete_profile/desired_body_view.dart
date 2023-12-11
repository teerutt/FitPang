import 'package:fitpang/view/complete_profile/goal_period.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/round_button.dart';
import 'package:fitpang/view/maintab/maintab_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DesiredBody extends StatefulWidget {
  final int userId;
  final String gender;
  final int age;
  final int height;
  final int weight;
  final String goal;
  final int current_body;
  const DesiredBody({super.key, required this.userId, required this.gender, required this.age, required this.height, required this.weight, required this.goal, required this.current_body});

  @override
  State<DesiredBody> createState() => _DesiredBodyState();
}

class _DesiredBodyState extends State<DesiredBody> {
  int _current = 0;
  CarouselController buttonCarouselController = CarouselController();

  List desiredBodyArr = [
    {
      "image": "assets/img/desired_body1.png",
      "title": "3-4%",
      "suggestion":
          "Get ready to break a sweat! This target is not easy but we’re sure you are ready!",
      "tag": "0"
    },
    {
      "image": "assets/img/desired_body2.png",
      "title": "6-7%",
      "suggestion":
          "Step by step! This goal is practical and friendly for beginners.",
      "tag": "1"
    },
    {
      "image": "assets/img/desired_body3.png",
      "title": "10-12%",
      "suggestion":
          "Step by step! This goal is practical and friendly for beginners.",
      "tag": "2"
    },
    {
      "image": "assets/img/desired_body4.png",
      "title": "13-15%",
      "suggestion":
          "This body fat level seems too high for you, which might cause some health issues...",
      "tag": "3"
    },
    {
      "image": "assets/img/desired_body5.png",
      "title": "16-20%",
      "suggestion":
          "This body fat level seems too high for you, which might cause some health issues...",
      "tag": "4"
    },
  ];

  @override
  Widget build(BuildContext context) {
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
            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "What's your desired\nbody shape",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: TColor.black),
                  ),
                  SizedBox(
                    height: 10.0,
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
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    items: desiredBodyArr.map((bObj) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: TColor.white,
                              border: Border.all(
                                color: TColor.gray,
                                width: 3.0,
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
                  )),
                  SizedBox(
                    height: media.width * 0.03,
                  ),
                  // Carousel Indicators
                  Positioned(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: desiredBodyArr.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              buttonCarouselController.animateToPage(entry.key),
                          child: Container(
                            width: 22.0,
                            height: 12.0,
                            margin: EdgeInsets.symmetric(
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
                    height: media.width * 0.03,
                  ),

                  // !!! Estimated Body Fat (grey box) !!!
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: 330,
                    height: 50,
                    decoration: BoxDecoration(
                      color: TColor.lightGray,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Your estimated Body Fat",
                        style: TextStyle(
                          color: TColor.black,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 10.0, right: 10.0),
                    width: 330,
                    height: 120,
                    decoration: BoxDecoration(
                      color: TColor.lightenGray,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${desiredBodyArr[_current]["title"]}",
                          style: TextStyle(
                            color: Colors.orange[600],
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          "${desiredBodyArr[_current]["suggestion"]}",
                          style: TextStyle(
                            color: TColor.black,
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
                          builder: (context) => GoalPeriod(userId: widget.userId, gender: widget.gender, weight: widget.weight, height: widget.height, age: widget.age, goal: widget.goal, current_body: widget.current_body, desired_body: _current,),
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
