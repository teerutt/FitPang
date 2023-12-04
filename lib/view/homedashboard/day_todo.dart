import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/dbhelper.dart';

class DayTodo extends StatefulWidget {
  final int userId;
  const DayTodo({super.key, required this.userId});

  @override
  State<DayTodo> createState() => _DayTodoState();
}

class _DayTodoState extends State<DayTodo> {
  late DateTime planDate = DateTime(2001,1,1);
  late String program1 = '';
  late String program2 = '';

  @override
  void initState() {
    super.initState();
    loadplanDate();
    loadProgram();
  }

  Future<void> loadplanDate() async {
    final DateTime dateCreated = await getPlanDate(widget.userId);
    setState(() {
      this.planDate = dateCreated;
    });
  }

  Future<void> loadProgram() async {
    final program1 = await getProgram(widget.userId, 1);
    final program2 = await getProgram(widget.userId, 2);
    setState(() {
      this.program1 = program1;
      this.program2 = program2;
    });
  }

  @override
  Widget build(BuildContext context) {
    int days = DateTime.now().difference(planDate).inDays + 1;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                  ],
                ),
              // Row 1
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, bottom: 15, left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          colors: TColor.primaryG,
                        ),
                      ),
                      child: Text(
                        "Day 1",
                        style: TextStyle(
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
                    "Weight Training",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[700]),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Weight Training",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 300,
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    colors: TColor.primaryG,
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "W",
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
                            Text("Chest",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text("5 Workouts",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                          ],
                        ),
                      )
                    ]),
              ),
              SizedBox(height: 15.0),
              Container(
                alignment: Alignment.center,
                width: 300,
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    colors: TColor.primaryG,
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "W",
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
                            Text("Chest",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text("5 Workouts",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                          ],
                        ),
                      )
                    ]),
              ),
              SizedBox(height: 15.0),
              Container(
                alignment: Alignment.center,
                width: 300,
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    colors: TColor.primaryG,
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "W",
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
                            Text("Chest",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text("5 Workouts",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                          ],
                        ),
                      )
                    ]),
              ),
              SizedBox(height: 15.0),
              Container(
                alignment: Alignment.center,
                width: 300,
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    colors: TColor.primaryG,
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "W",
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
                            Text("Chest",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Text("5 Workouts",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black)),
                          ],
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Cardio",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 300,
                height: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    colors: TColor.primaryG,
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 0, left: 30, right: 0),
                        child: Image.asset(
                          "assets/img/runmen.png", // Replace with the correct path to your image asset
                          width: 80, // Adjust the width as needed
                          height: 80, // Adjust the height as needed
                          fit: BoxFit.contain, // Adjust the fit as needed
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 0, left: 0, right: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Jogging",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
        ),
      );
  }
}
