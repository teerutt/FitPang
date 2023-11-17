import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';

class EventsView extends StatefulWidget {
  const EventsView({Key? key}) : super(key: key);

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey, // Background color of the circle
                        ),
                        padding: const EdgeInsets.all(1.0),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: Colors.white, // Icon color
                        ),
                      ),
                      Text(
                        "   Events",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    color: Colors.black, // Color of the SizedBox
                    height: 3, // Adjust the height as needed
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/img/muscle.png",
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
                                  "Learn the Basic of Training",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "| 06 Workouts for Beginner",
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
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/img/muscle.png",
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
                                  "Learn the Basic of Training",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "| 06 Workouts for Beginner",
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
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/img/muscle.png",
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
                                  "Learn the Basic of Training",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "| 06 Workouts for Beginner",
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
                  SizedBox(height: 10),
                  Container(
                    width: 350,
                    height: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/img/muscle.png",
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
                                  "Learn the Basic of Training",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "| 06 Workouts for Beginner",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
