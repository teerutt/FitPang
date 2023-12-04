import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';

class Weightdetail extends StatefulWidget {
  const Weightdetail({super.key});

  @override
  State<Weightdetail> createState() => _WeightdetailState();
}

class _WeightdetailState extends State<Weightdetail> {
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
                      width: 200,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          colors: TColor.primaryG,
                        ),
                      ),
                      child: Text(
                        "Push Up",
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
                    Image.asset(
                      "assets/img/pushup.png",
                      width: media.width * 0.9,
                      height: media.height * 0.2,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "ท่าวิดพื้นเป็นท่าออกกำลังกายที่ได้รับความนิยมมากที่สุด บริหารกล้ามเนื้ออก หัวไหล่ และ triceps",
                              style: TextStyle(
                                fontSize: 18,
                                // fontWeight: FontWeight.bold,
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