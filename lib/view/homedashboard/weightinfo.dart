import 'package:fitpang/dbhelper.dart';
import 'package:fitpang/view/homedashboard/weightdetail.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'dart:typed_data';

class Weightinfo extends StatefulWidget {
  final String muscle;
  const Weightinfo({super.key, required this.muscle});

  @override
  State<Weightinfo> createState() => _WeightinfoState();
}

class _WeightinfoState extends State<Weightinfo> {
  late List<Map<String, Object?>> exercises = [];

  @override
  void initState() {
    super.initState();
    loadEx();
  }

  Future<void> loadEx() async {
    final ex = await getEx(widget.muscle);
    setState(() {
      exercises = ex;
    });
  }

  @override
  Widget build(BuildContext context) {
    String topic = '';
    switch (widget.muscle) {
      case 'CH':
        topic = 'Chest';
      case 'AM':
        topic = 'Arm';
      case 'BD':
        topic = 'Core Body';
      case 'BK':
        topic = 'Back';
      case 'LG':
        topic = 'Leg';
    }
    var media = MediaQuery.of(context).size;
    List<Widget> exerciseWidgets = [];
    String exerciseName;
    Uint8List exerciseImg;

    for (int i = 0; i < exercises.length; i++) {
      Map<String, Object?> exercise = exercises[i];
      exerciseName = exercise['pose_name'] as String? ?? '';
      exerciseImg = exercise['pv'] as Uint8List;
      //print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab ${exercise['pv']}');

      exerciseWidgets.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Weightdetail(),
              ),
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
                      top: 0, bottom: 0, left: 10, right: 0),
                  child: exerciseImg.isNotEmpty
                                    ? ClipRect(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0),
                                            child: Image.memory(
                                              exerciseImg,
                                              width:
                                                  100, // Set width as needed
                                              height:
                                                  null, // Set height as needed
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                    : CircularProgressIndicator(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 0, left: 0, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        exerciseName,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      exerciseWidgets.add(SizedBox(height: 15.0,));
    }
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
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
                            color:
                                Colors.grey, // Background color of the circle
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
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, bottom: 15, left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: media.height * 0.08,
                          width: media.width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            gradient: LinearGradient(
                              colors: TColor.primaryG,
                            ),
                          ),
                          child: Text(
                            topic,
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: exerciseWidgets,
                  ),
                  SizedBox(height: 15.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
