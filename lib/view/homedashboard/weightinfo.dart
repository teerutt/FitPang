import 'package:fitpang/view/homedashboard/weightdetail.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';

class Weightinfo extends StatefulWidget {
  const Weightinfo({super.key});

  @override
  State<Weightinfo> createState() => _WeightinfoState();
}

class _WeightinfoState extends State<Weightinfo> {
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
                      height: media.height * 0.08,
                      width: media.width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                          colors: TColor.primaryG,
                        ),
                      ),
                      child: Text(
                        "Chest",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to WeightTrainingPage when the container is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Weightdetail()),
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
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, bottom: 0, left: 0, right: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Push Up",
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
              SizedBox(height: 15.0),
            ]),
          ),
        ]),
      ),
    );
  }
}
