import 'dart:typed_data';

import 'package:fitpang/view/homedashboard/blank_view.dart';
import 'package:fitpang/view/homedashboard/eventdetail.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';

class EventsView extends StatefulWidget {
  final List<Map<String, Object?>> events;
  const EventsView({Key? key, required this.events}) : super(key: key);

  @override
  State<EventsView> createState() => _EventsViewState();
}

class _EventsViewState extends State<EventsView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> eventWidgets = [];
    for (int i = 0; i < widget.events.length; i++) {
      Map<String, Object?> event = widget.events[i];

      eventWidgets.add(
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Eventdetail(id: widget.events[i]['event_id'] as int,),
              ),
            );
          },
          child: Container(
                    width: 350,
                    height: 175,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: DecorationImage(
                          image: MemoryImage(event['pic1'] as Uint8List),
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
                                  event['name'] as String,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "| Event ${event['event_id']}",
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
        ),
      );
      eventWidgets.add(SizedBox(height: 15.0,));
    }
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
                  Column(
                    children: eventWidgets,
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
