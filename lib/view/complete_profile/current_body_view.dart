import 'package:fitpang/view/complete_profile/desired_body_view.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/round_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitpang/view/maintab/maintab_view.dart';

class CurrentBody extends StatefulWidget {
  final int userId;
  final String gender;
  final int age;
  final int height;
  final int weight;
  final String goal;
  const CurrentBody({super.key, required this.userId, required this.gender, required this.age, required this.height, required this.weight, required this.goal});

  @override
  State<CurrentBody> createState() => _CurrentBodyState();
}

class _CurrentBodyState extends State<CurrentBody> {

  int _current = 0;
  CarouselController buttonCarouselController = CarouselController();

  List currentBodyArr = [
    {
      "image": "assets/img/current_body1.png",
      "title": "26-30%",
      "suggestion": "Your figure is almost perfect! Keep it up!",
      "tag": "0"
    },
    {
      "image": "assets/img/current_body2.png",
      "title": "31-35%",
      "suggestion": "You are at normal body fit level! Try the personalized plan for you to get fitter and healthier.",
      "tag": "1"
    },
    {
      "image": "assets/img/current_body3.png",
      "title": "36-40%",
      "suggestion": "You may have a slow metabolism, and face some potential health problems.",
      "tag": "2"
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
            Positioned(
              right: 15.0,
              top: 15.0,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                padding: const EdgeInsets.all(0.25),
                child: IconButton(
                  icon: const Icon(Icons.home_outlined),
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
                    height: media.width * 0.15,
                  ),
                  Center(
                    child: CarouselSlider(
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        height: media.height * 0.25,
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
                      items: currentBodyArr.map((bObj) {
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
                              clipBehavior: Clip.antiAlias,
                              child: FittedBox(
                                child: Image.asset(
                                  bObj["image"].toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    )
                  ),
                  SizedBox(
                    height: media.width * 0.03,
                  ),
                  Positioned(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: currentBodyArr.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              buttonCarouselController.animateToPage(entry.key),
                          child: Container(
                            width: 24.0,
                            height: 12.0,
                            margin:
                                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness == Brightness.dark
                                      ? Colors.white
                                      : Colors.black)
                                  .withOpacity(_current == entry.key ? 0.9 : 0.4),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  SizedBox(
                    height: media.width * 0.1,
                  ),
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
                    padding: const EdgeInsets.all(10.0),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "${currentBodyArr[_current]["title"]}",
                            style: TextStyle(
                              color: Colors.orange[600],
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            "${currentBodyArr[_current]["suggestion"]}",
                            style: TextStyle(
                              color: TColor.black,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                          builder: (context) => DesiredBody(userId: widget.userId, gender: widget.gender, weight: widget.weight, height: widget.height, age: widget.age, goal: widget.goal, current_body: _current,),
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