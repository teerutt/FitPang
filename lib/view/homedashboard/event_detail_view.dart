import 'package:flutter/material.dart';
import 'package:fitpang/dbhelper.dart';
import 'package:fitpang/common/color_extension.dart';
import 'dart:typed_data';

class Eventdetail extends StatefulWidget {
  final int id;
  const Eventdetail({super.key, required this.id});

  @override
  State<Eventdetail> createState() => _EventdetailState();
}

class _EventdetailState extends State<Eventdetail> {
  late Map<String, Object?> event = {};

  @override
  void initState() {
    super.initState();
    loadEvents();
  }

  Future<void> loadEvents() async {
    final event_ = await getEvent(widget.id);
    setState(() {
      event = event_;
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
            physics: const BouncingScrollPhysics(),
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
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                      padding: const EdgeInsets.all(0.25),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: Colors.white,
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
                        event['name'] as String,
                        style: const TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
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
                    const SizedBox(height: 20.0),
                    ((event['pic2']) as Uint8List).isNotEmpty
                                    ? ClipRect(
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0),
                                            child: Image.memory(
                                              (event['pic2']) as Uint8List,
                                              width:
                                                  media.width * 0.8,
                                              height:
                                                  null,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      )
                                    : const CircularProgressIndicator(),
                    const SizedBox(height: 10.0),                
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '\n${event['description'] as String}',
                              textAlign: TextAlign.left,
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
