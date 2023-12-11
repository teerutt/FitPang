// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:intl/intl.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Map<String, String>> itemsWithSubtitle = [
    {
      "title": "• Today's plan has arrived ",
      "subtitle": "Check your Today workout plan."
    },
    {
      "title": "• Today's plan has arrived",
      "subtitle": "Check your Today calories plan."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            const Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
              child: Text(
                "Notifications",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: itemsWithSubtitle.length,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                itemBuilder: (BuildContext context, int index) {
                  final item = itemsWithSubtitle[index];
                  return Dismissible(
                    key: ValueKey<String>(item["title"]!),
                    background: Container(
                      color: Colors.red,
                      child: const Icon(Icons.delete),
                    ),
                    onDismissed: (DismissDirection direction) {
                      setState(() {
                        itemsWithSubtitle.removeAt(index);
                      });
                    },
                    child: ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item["title"]!,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat('h:mm a').format(DateTime.now()),
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      subtitle: item["subtitle"]!.isNotEmpty
                          ? Text(
                              item["subtitle"]!,
                              style: const TextStyle(fontSize: 14),
                            )
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}