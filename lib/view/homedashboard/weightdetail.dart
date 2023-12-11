import 'package:flutter/material.dart';
import 'package:fitpang/dbhelper.dart';
import 'package:fitpang/common/color_extension.dart';
import 'dart:typed_data';

class Weightdetail extends StatefulWidget {
  final String pattern;
  final String code;
  const Weightdetail({super.key, required this.code, required this.pattern});

  @override
  State<Weightdetail> createState() => _WeightdetailState();
}

class _WeightdetailState extends State<Weightdetail> {
  late Map<String, Object?> exercise = Map();

  @override
  void initState() {
    super.initState();
    loadEx();
  }

  Future<void> loadEx() async {
    final ex = await getExbycode(widget.code, null);
    setState(() {
      exercise = ex;
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
                    top: 0, bottom: 15, left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 300,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          colors: TColor.primaryG,
                        ),
                      ),
                      child: Text(
                        exercise['pose_name'] as String,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: media.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    colors: TColor.primaryG,
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20.0),
                    ((exercise['picture']) as Uint8List).isNotEmpty
                                    ? ClipRect(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0),
                                            child: Image.memory(
                                              (exercise['picture']) as Uint8List,
                                              width:
                                                  media.width * 0.8, // Set width as needed
                                              height:
                                                  null, // Set height as needed
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                    : CircularProgressIndicator(),
                    SizedBox(height: 10.0),                
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '\n'+(exercise['instructions'] as String),
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins',
                                color: TColor.black,
                              ),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
