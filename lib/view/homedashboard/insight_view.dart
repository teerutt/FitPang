import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common/color_utils.dart';
import 'package:fitpang/common_widget/date_utils.dart' as date_util;
import 'package:percent_indicator/circular_percent_indicator.dart';

class Insight2 extends StatefulWidget {
  final int userId;
  final String title;
  const Insight2({Key? key, required this.title, required this.userId})
      : super(key: key);

  @override
  _Insight2State createState() => _Insight2State();
}

class _Insight2State extends State<Insight2> {
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> todos = <String>[];
  TextEditingController controller = TextEditingController();
  bool click = true;
  bool? _isChecked = false;
  bool? _isChecked2 = false;
  int totalTodos = 2; // Assuming there are 4 checkboxes initially
  int completedTodos = 0; // Counter to track completed todos

  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 70.0 * currentDateTime.day);
    super.initState();
  }

  Widget titleView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Text(
        date_util.DateUtils.months[currentDateTime.month - 1] +
            ' ' +
            currentDateTime.year.toString(),
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
    );
  }

  Widget hrizontalCapsuleListView() {
    return Container(
      width: width,
      height: 100,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentMonthList.length,
        itemBuilder: (BuildContext context, int index) {
          return capsuleView(index);
        },
      ),
    );
  }

  Widget capsuleView(int index) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              currentDateTime = currentMonthList[index];
            });
          },
          child: Container(
            width: 70,
            height: 100,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: (currentMonthList[index].day != currentDateTime.day)
                        ? [
                            Colors.white.withOpacity(0.8),
                            Colors.white.withOpacity(0.7),
                            Colors.white.withOpacity(0.6)
                          ]
                        : [
                            HexColor("ED6184"),
                            HexColor("EF315B"),
                            HexColor("E2042D")
                          ],
                    begin: const FractionalOffset(0.0, 0.0),
                    end: const FractionalOffset(0.0, 1.0),
                    stops: const [0.0, 0.5, 1.0],
                    tileMode: TileMode.clamp),
                borderRadius: BorderRadius.circular(40),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 1,
                    spreadRadius: 1,
                    color: Colors.black26,
                  )
                ]),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    currentMonthList[index].day.toString(),
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? HexColor("465876")
                                : Colors.white),
                  ),
                  Text(
                    date_util.DateUtils
                        .weekdays[currentMonthList[index].weekday - 1],
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color:
                            (currentMonthList[index].day != currentDateTime.day)
                                ? HexColor("465876")
                                : Colors.white),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Widget topView() {
    return Container(
      height: height * 0.3,
      width: width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            titleView(),
            hrizontalCapsuleListView(),
          ]),
    );
  }

  Widget todoList() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, height * 0.38, 10, 10),
      width: width,
      height: height * 0.60,
      child: ListView.builder(
          itemCount: todos.length,
          padding: EdgeInsets.zero,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
              width: width - 20,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white12,
                        blurRadius: 2,
                        offset: Offset(2, 2),
                        spreadRadius: 3)
                  ]),
              child: Center(
                child: Text(
                  todos[index],
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
    );
  }

  double calculatePercentage() {
    if (totalTodos == 0) {
      return 0.0;
    }
    return completedTodos / totalTodos;
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: TColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Column(
              children: [
                Stack(
                  children: <Widget>[
                    topView(),
                    todoList(),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height *
                          0.15, // Set the bottom to 0 to move it to the bottom
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Finished Workout",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                              SizedBox(height: 10.0),
                              CheckboxListTile(
                                title: Text("Mafuq ka"),
                                value: _isChecked,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    _isChecked = newValue;
                                    if (_isChecked == true) {
                                      completedTodos++;
                                    } else {
                                      completedTodos--;
                                    }
                                  });
                                },
                                activeColor: Colors.orangeAccent,
                                checkColor: Colors.white,
                                tileColor: Colors.black12,
                              ),
                              SizedBox(height: 10.0),
                              CheckboxListTile(
                                title: Text("Mafuq ka"),
                                value: _isChecked2,
                                onChanged: (bool? newValue) {
                                  setState(() {
                                    _isChecked2 = newValue;
                                    if (_isChecked2 == true) {
                                      completedTodos++;
                                    } else {
                                      completedTodos--;
                                    }
                                  });
                                },
                                activeColor: Colors.orangeAccent,
                                checkColor: Colors.white,
                                tileColor: Colors.black12,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.45,
                      left: 0,
                      right: 0,
                      child: CircularPercentIndicator(
                        animation: true,
                        animateFromLastPercent: true,
                        radius: 100,
                        lineWidth: 13,
                        percent: calculatePercentage(),
                        progressColor: TColor.primaryColor1,
                        backgroundColor: Colors.grey,
                        circularStrokeCap: CircularStrokeCap.round,
                        center: Text(
                          "${(calculatePercentage() * 100).toStringAsFixed(0)}%",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}