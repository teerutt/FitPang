// ignore_for_file: prefer_const_constructors
import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/view/homedashboard/calories_view.dart';
import 'package:fitpang/view/homedashboard/day_todo.dart';
import 'package:fitpang/view/maintab/maintab_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fitpang/view/homedashboard/events.dart';
import 'package:fitpang/dbhelper.dart';
import 'package:fitpang/view/homedashboard/eventdetail.dart';
import 'package:quickalert/quickalert.dart';

class HomeHavePlan extends StatefulWidget {
  final int userId;
  const HomeHavePlan({Key? key, required this.userId}) : super(key: key);

  @override
  State<HomeHavePlan> createState() => _HomeHavePlanState();
}

class _HomeHavePlanState extends State<HomeHavePlan> {
  late List<Map<String, Object?>> events = [];
  late String firstName = '';
  late double bmi = 1.0;
  late int days = 0;
  late String program1 = '';
  late String program2 = '';
  late int week = 0;
  late int weekId = 0;

  @override
  void initState() {
    super.initState();
    loadFirstName();
    loadBMI();
    loadDay();
    loadProgram();
    loadWeek();
    loadEvents();
  }

  void showAlert() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.confirm,
      title: 'Are you sure to delete your plan?',
      confirmBtnText: 'Yes',
      cancelBtnText: 'No',
      confirmBtnColor: Colors.red,
      titleColor: Colors.white,
      headerBackgroundColor: Colors.grey,
      onConfirmBtnTap: () async {
        await deletePlan(widget.userId);
        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainTabView(
                                  userId: widget.userId,
                                )),
                      );
      }
    );
  }

  Future<void> loadWeek() async {
    final week_ = (await getWeek(widget.userId))['week'] as int;
    setState(() {
      week = week_;
    });
  }

  Future<void> loadFirstName() async {
    final firstName = await getFirstName(widget.userId);
    setState(() {
      this.firstName = firstName;
    });
  }

  Future<void> loadBMI() async {
    final BMI = await calculateBMI(widget.userId);
    setState(() {
      bmi = BMI;
    });
  }

  Future<void> loadDay() async {
    final daySinceCreated = await getDay(widget.userId);
    setState(() {
      days = daySinceCreated;
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

  Future<void> loadEvents() async {
    final event_ = await queryEvent();
    setState(() {
      events = event_;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              // Row 1
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome Back, \n$firstName",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      DateFormat('d MMM yyyy').format(DateTime.now()),
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 330,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      gradient: LinearGradient(
                        colors: TColor.primaryG,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                "BMI (Body Mass Index)",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 7),
                              Text(
                                "You have a normal weight",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 20, // Adjust the vertical position of the circle
                          right:
                              30, // Adjust the horizontal position of the circle
                          child: Container(
                            width: 100,
                            height: 140,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .white, // Set the background color of the circle
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black
                                      .withOpacity(0.5), // Set the shadow color
                                  spreadRadius:
                                      3, // Set the spread radius of the shadow
                                  blurRadius:
                                      5, // Set the blur radius of the shadow
                                  offset: Offset(
                                      3, 3), // Set the offset of the shadow
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Your BMI", // Set the text inside the circle
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "$bmi",
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        Text(
                          "Today Workout Plan",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              showAlert();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors
                                  .red, // Change the color to your desired color
                            ),
                            child: Text("Delete Plan")),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DayTodo(
                                  userId: widget.userId,
                                )),
                      );
                    },
                    child: Container(
                      width: 330,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/img/workoutplan.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Day " "$days" " - " "$program1",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "| $program2",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.orange[300],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        Text(
                          "Today Calories Plan",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CaloriesView(
                                  userId: widget.userId,
                                )),
                      );
                    },
                    child: Container(
                      width: 330,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage("assets/img/today_calories.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Week $week - Nutritions",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Event",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigate to the page you want when "See All" is tapped
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EventsView(
                                          events: events,
                                        )), // Replace YourTargetPage with the actual page you want to navigate to
                              );
                            },
                            child: Text(
                              "See All",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange[700],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  // Add your container here
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Eventdetail(
                            id: events.first['event_id'] as int,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 330,
                      height: 170,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/img/funrun.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: const [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "FUN RUN AND MUSIC",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
