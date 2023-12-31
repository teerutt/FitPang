import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/dbhelper.dart';
import 'package:fitpang/view/complete_profile/gender_view.dart';
import 'package:fitpang/view/homedashboard/event_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common_widget/round_button_create.dart';
import 'package:intl/intl.dart';
import 'package:fitpang/view/homedashboard/events_view.dart';

class HomeNoPlan extends StatefulWidget {
  final int userId;
  const HomeNoPlan({Key? key, required this.userId}) : super(key: key);

  @override
  State<HomeNoPlan> createState() => _HomeNoPlanState();
}

class _HomeNoPlanState extends State<HomeNoPlan> {
  late List<Map<String, Object?>> events = [];
  late String firstName = '';

  @override
  void initState() {
    super.initState();
    loadFirstName();
    loadEvents();
  }

  Future<void> loadFirstName() async {
    final firstName = await getFirstName(widget.userId);
    if (mounted) {
      setState(() {
        this.firstName = firstName;
      });
    }
  }

  Future<void> loadEvents() async {
    final event_ = await queryEvent();
    setState(() {
      events = event_;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Column(
          children: [
            // Row 1
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome Back, \n$firstName",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat('d MMM yyyy').format(DateTime.now()),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                RoundButtonCreate(
                  title: "+ Create Plan",
                  onPressed: () {
                    print('userId: ${widget.userId}');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              GenderView(userId: widget.userId)),
                    );
                  },
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Event",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventsView(
                                      events: events,
                                    )),
                          );
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[700],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Eventdetail(
                          id: events.first['event_id'] as int,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 330,
                    height: 170,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        image: const DecorationImage(
                          image: AssetImage(
                            "assets/img/funrun.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    child: const Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "FUN RUN AND MUSIC",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
