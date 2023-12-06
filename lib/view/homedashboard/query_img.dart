import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/dbhelper.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BlankView extends StatefulWidget {
  const BlankView({Key? key}) : super(key: key);

  @override
  State<BlankView> createState() => _BlankViewState();
}

class _BlankViewState extends State<BlankView> {
  Map<String, Uint8List?> imageBytes = {
    'ch': null,
    'am': null,
    'bk': null,
    'bd': null,
    'lg': null,
  };

  @override
  void initState() {
    super.initState();
    loadImage('ch', 'CH05');
    loadImage('am', 'AM01');
    loadImage('bk', 'BK04');
    loadImage('bd', 'BD01');
    loadImage('lg', 'LG02');
  }

  Future<void> loadImage(String key,String ex_code) async {
    final imageData = await getImage(ex_code);
    setState(() {
      imageBytes[key] = imageData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: imageBytes != null
            ? Image.memory(
                imageBytes['ch']!,
                width: 50, // Set width as needed
                height: null, // Set height as needed
                fit: BoxFit.cover, // Adjust the fit based on your requirements
              )
            : CircularProgressIndicator(), // Show a loading indicator while fetching the image
      ),
    );
  }
}
