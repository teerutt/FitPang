import 'package:fitpang/view/complete_profile/desired_body.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/round_button.dart';
import 'package:fitpang/common_widget/carousel_silder.dart';

class CurrentBody extends StatefulWidget {
  const CurrentBody({super.key});

  @override
  State<CurrentBody> createState() => _CurrentBodyState();
}

class _CurrentBodyState extends State<CurrentBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "What's your current body",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: TColor.black),
                  ),
                  Text(
                    "shape?",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: TColor.black),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    width: 330,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You Estimated Body Fat(Approx.)",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    width: 330,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "10% - 15% (Ideal)",
                            style: TextStyle(
                              color: Colors.green[600],
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Flexible(
                            child: Text(
                              "Your figure is almost perfect! Keep it up!",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Use Expanded to make sure the Confirm button takes the remaining space
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: RoundButton(
                    title: "Confirm",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DesiredBody(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
