import 'package:fitpang/view/homedashboard/aerobic_view.dart';
import 'package:fitpang/view/homedashboard/jogging_view.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/dbhelper.dart';
import 'package:fitpang/view/homedashboard/weightinfo.dart';
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
  late String patternId = '';
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
    loadPattern();
    loadProgram();
    loadImage('ch', 'CH05');
    loadImage('am', 'AM01');
    loadImage('bk', 'BK04');
    loadImage('bd', 'BD01');
    loadImage('lg', 'LG02');
  }

  Future<void> loadPattern() async {
    final String pattern =
        (await getWeek(widget.userId))['pattern_id'] as String;
    setState(() {
      patternId = pattern;
    });
  }

  Future<void> loadImage(String key, String ex_code) async {
    final imageData = (await getExbycode(ex_code, null))['pv'] as Uint8List;
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
                ],
              ),
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
                    const SizedBox(height: 10.0),
                    const Padding(
                      padding: EdgeInsets.all(30.0),
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
                    const Text(
                            "Choose up to 2 pose for each muscle\n",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                ),
                          ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Weightinfo(
                                    pattern: patternId,
                                    muscle: 'CH',
                                  )),
                        );
                      },
                      child: Container(
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
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0.0),
                                          child: Image.memory(
                                            imageBytes['ch']!,
                                            width: 100, // Set width as needed
                                            height:
                                                null, // Set height as needed
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const CircularProgressIndicator(),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Chest",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Text("Workouts",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Weightinfo(
                                    pattern: patternId,
                                    muscle: 'AM',
                                  )),
                        );
                      },
                      child: Container(
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
                              child: imageBytes['am'] != Uint8List(0)
                                  ? ClipRect(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0.0),
                                          child: Image.memory(
                                            imageBytes['am']!,
                                            width: null, // Set width as needed
                                            height: 120, // Set height as needed
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const CircularProgressIndicator(),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Arm",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Text("Workouts",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Weightinfo(
                                    pattern: patternId,
                                    muscle: 'BD',
                                  )),
                        );
                      },
                      child: Container(
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
                              child: imageBytes['bd'] != Uint8List(0)
                                  ? ClipRect(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0.0),
                                          child: Image.memory(
                                            imageBytes['bd']!,
                                            width: 123, // Set width as needed
                                            height:
                                                null, // Set height as needed
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const CircularProgressIndicator(),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Core Body",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Text("Workouts",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Weightinfo(
                                    pattern: patternId,
                                    muscle: 'BK',
                                  )),
                        );
                      },
                      child: Container(
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
                              child: imageBytes['bk'] != Uint8List(0)
                                  ? ClipRect(
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0.0),
                                          child: Image.memory(
                                            imageBytes['bk']!,
                                            width: 123, // Set width as needed
                                            height:
                                                null, // Set height as needed
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const CircularProgressIndicator(),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Back",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Text("Workouts",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Weightinfo(
                                    pattern: patternId,
                                    muscle: 'LG',
                                  )),
                        );
                      },
                      child: Container(
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
                              padding: const EdgeInsets.only(left: 20.0),
                              child: imageBytes['lg'] != Uint8List(0)
                                  ? ClipRect(
                                      child: Align(
                                        alignment: Alignment.centerRight,
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
                                  : const CircularProgressIndicator(),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Leg",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  Text("Workouts",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black)),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Visibility(
                visible: program1 == 'Cardio' || program2 == 'Cardio',
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(30.0),
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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Jogginginfo()),
                        );
                      },
                      child: Container(
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
                            const Padding(
                              padding: EdgeInsets.only(
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
                    ),
                    const SizedBox(height: 15.0,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Jogginginfo()),
                        );
                      },
                      child: Container(
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
                                "assets/img/swimmen.png", // Replace with the correct path to your image asset
                                width: 80, // Adjust the width as needed
                                height: 80, // Adjust the height as needed
                                fit: BoxFit.contain, // Adjust the fit as needed
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 0, bottom: 0, left: 0, right: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Swimming",
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
                    ),
                    const SizedBox(height: 15.0,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Jogginginfo()),
                        );
                      },
                      child: Container(
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
                                "assets/img/ridemen.png", // Replace with the correct path to your image asset
                                width: 80, // Adjust the width as needed
                                height: 80, // Adjust the height as needed
                                fit: BoxFit.contain, // Adjust the fit as needed
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 0, bottom: 0, left: 0, right: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Cycling",
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
                    ),
                    const SizedBox(height: 15.0,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Aerobicinfo()),
                        );
                      },
                      child: Container(
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
                                "assets/img/aerobicmen.png", // Replace with the correct path to your image asset
                                width: 80, // Adjust the width as needed
                                height: 80, // Adjust the height as needed
                                fit: BoxFit.contain, // Adjust the fit as needed
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                  top: 0, bottom: 0, left: 0, right: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Aerobic",
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
                    ),
                    const SizedBox(height: 15.0,),
                    
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
