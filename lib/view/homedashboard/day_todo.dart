import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/dbhelper.dart';
import 'dart:typed_data';

class DayTodo extends StatefulWidget {
  final int userId;
  const DayTodo({super.key, required this.userId});

  @override
  State<DayTodo> createState() => _DayTodoState();
}

class _DayTodoState extends State<DayTodo> {
  late int days = 0;
  late String program1 = '';
  late String program2 = '';
  late Map<String, Uint8List> imageBytes = {
    'ch': Uint8List(0),
    'am': Uint8List(0),
    'bk': Uint8List(0),
    'bd': Uint8List(0),
    'lg': Uint8List(0),
  };

  @override
  void initState() {
    super.initState();
    loadDay();
    loadProgram();
    loadImage('ch', 'CH05');
    loadImage('am', 'AM01');
    loadImage('bk', 'BK04');
    loadImage('bd', 'BD01');
    loadImage('lg', 'LG02');
  }

  Future<void> loadImage(String key, String ex_code) async {
    final imageData = await getImage(ex_code);
    setState(() {
      imageBytes[key] = imageData;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(children: [
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
                      "Day $days",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  program2 == '' ? program1 : '$program1 and $program2',
                  style: TextStyle(
                      fontSize: program1 == 'Rest' ? 40 : 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[700]),
                ),
              ],
            ),
            Visibility(
              visible: program1 == 'Weight Training',
              child: Column(
                children: [
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
                            child: imageBytes['ch'] != Uint8List(0)
                                ? ClipRect(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      widthFactor: 0.55, // Crop the image to half of its width
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25.0),
                                        child: Image.memory(
                                          imageBytes['ch']!,
                                          width: null, // Set width as needed
                                          height: 100, // Set height as needed
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                : CircularProgressIndicator(),
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
                            child: imageBytes['ch'] != Uint8List(0)
                                ? ClipRect(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      widthFactor: 1,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25.0),
                                        child: Image.memory(
                                          imageBytes['am']!,
                                          width: null, // Set width as needed
                                          height: 120, // Set height as needed
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                : CircularProgressIndicator(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Arm",
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
                            child: imageBytes['ch'] != Uint8List(0)
                                ? ClipRect(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      widthFactor: 1, // Crop the image to half of its width
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Image.memory(
                                          imageBytes['bd']!,
                                          width: 123, // Set width as needed
                                          height: null, // Set height as needed
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                : CircularProgressIndicator(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Core Body",
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
                            child: imageBytes['ch'] != Uint8List(0)
                                ? ClipRect(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      widthFactor: 1, // Crop the image to half of its width
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Image.memory(
                                          imageBytes['bk']!,
                                          width: 123, // Set width as needed
                                          height: null, // Set height as needed
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                : CircularProgressIndicator(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Back",
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
                            padding: const EdgeInsets.only(left: 50.0),
                            child: imageBytes['ch'] != Uint8List(0)
                                ? ClipRect(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      widthFactor: 0.5, // Crop the image to half of its width
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: Image.memory(
                                          imageBytes['lg']!,
                                          width: null, // Set width as needed
                                          height: 100, // Set height as needed
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  )
                                : CircularProgressIndicator(),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Leg",
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
                ],
              ),
            ),

            Visibility(
              visible: program2 == 'Cardio',
              child: Column(children: [
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
            )
          ]),
        ),
      ),
    );
  }
}