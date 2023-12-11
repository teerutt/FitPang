import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/dbhelper.dart';

class CaloriesView extends StatefulWidget {
  final int userId;
  const CaloriesView({super.key, required this.userId});

  @override
  State<CaloriesView> createState() => _CaloriesViewState();
}

class _CaloriesViewState extends State<CaloriesView> {
late int cal = 0, pro = 0, carb = 0, fats = 0, week = 0;
late String goal = '';

  @override
  void initState() {
    super.initState();
    loadNut();
    loadPlan();
  }
  Future<void> loadNut() async {
    final week_ = await getWeek(widget.userId);
    final nut = await getNut(widget.userId);
    
    setState(() {
      cal = nut['calories'] as int;
      pro = nut['protein'] as int;
      carb = nut['carb'] as int;
      fats = nut['fats'] as int;
      week = week_['week'] as int;
    });
  }

    Future<void> loadPlan() async {
    final goal_ = (await getPlan(widget.userId))['program'] as String;
    setState(() {
      goal = goal_;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: TColor.white,
        body: SafeArea(
          child: Stack(children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, bottom: 0, left: 20, right: 15),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                Colors.grey,
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
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 15, left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 150,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: TColor.lightGray,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black
                                    .withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            "Week $week",
                            style: const TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        goal,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[700]),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Positioned.fill(
                    bottom: 200,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 200,
                        height: 160,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: TColor.white,
                            width: 7,
                          ),
                          gradient: LinearGradient(
                            colors: TColor.primaryG,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(1, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$cal",
                              style: TextStyle(
                                fontSize: 32,
                                color: TColor.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "calories per day",
                              style: TextStyle(
                                fontSize: 14,
                                color: TColor.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          goal == 'Build Muscle' ? "These macronutrient values reflect your bulking\ncalories of $cal calories per day, which is a 500\ncalorie per day added to your maintenance of\n${cal-500} calories per day." :
                           "These macronutrient values reflect your cutting\ncalories of $cal calories per day, which is a 500\ncalorie per day deficit from your maintenance of\n${cal+500} calories per day.",
                          style: TextStyle(fontSize: 13, color: TColor.black),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 190,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            gradient: LinearGradient(colors: TColor.primaryG),
                          ),
                          child: const Text(
                            "Macronutrients",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: media.width * 0.05,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 300,
                          height: 85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: TColor.lightGray),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    "Protein (30%)",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("$pro g",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                        const SizedBox(height: 15.0),
                        Container(
                          alignment: Alignment.center,
                          width: 300,
                          height: 85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: TColor.lightGray),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    "Carbs (35%)",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("$carb g",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                        const SizedBox(height: 15.0),
                        Container(
                          alignment: Alignment.center,
                          width: 300,
                          height: 85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: TColor.lightGray),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    "Fat (35%)",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("$fats g",
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                    ],
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
