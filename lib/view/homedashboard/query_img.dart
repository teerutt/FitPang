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
  Uint8List? imageBytes; // Variable to store the image bytes

  @override
  void initState() {
    super.initState();
    // Fetch image data from your database when the widget initializes
    getImageFromDatabase();
  }

  // Method to fetch image data from the database (replace this with your database logic)
  void getImageFromDatabase() async {
    final db = await opendb();

    // Replace this with your actual database query
    List<Map<String, dynamic>> result = await db.rawQuery('SELECT picture FROM exercise LIMIT 1');

    if (result.isNotEmpty) {
      // Extract the BLOB data from the query result
      var imageData = result.first['picture'] as Uint8List?;

      setState(() {
        imageBytes = imageData;
      });
    }

    // Close the database connection
    await db.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: imageBytes != null
            ? Image.memory(
                imageBytes!,
                width: 300, // Set width as needed
                height: null, // Set height as needed
                fit: BoxFit.cover, // Adjust the fit based on your requirements
              )
            : CircularProgressIndicator(), // Show a loading indicator while fetching the image
      ),
    );
  }
}
