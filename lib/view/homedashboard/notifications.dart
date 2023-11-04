import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:intl/intl.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool isBarVisible = false;

  @override
  void initState() {
    super.initState();

    // To make the bar visible, you can use a Timer or some other trigger.
    // For demonstration, we will toggle it after a delay.
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isBarVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Notifications",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Container(
                  color: Colors.black, // Color of the SizedBox
                  height: 3, // Adjust the height as needed
                ),
                SizedBox(height: 15), // Add some spacing
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: TColor.primaryG,
                    ), // Background color
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)), // Border radius
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Congratulations",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black, // Text color
                              ),
                            ),
                            // Text("35% your daily challenge completed")
                          ],
                        ),
                        Text(
                          DateFormat('jm').format(DateTime.now()),
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // Text color
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
      ),
    );
  }
}
