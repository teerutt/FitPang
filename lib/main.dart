import 'package:flutter/material.dart';
import 'package:fitpang/view/onboarding/started_view.dart';
import 'package:fitpang/dbhelper.dart';
import 'common/color_extension.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure WidgetsBinding is initialized
  final dbHelper = DBhelper(); // Create an instance of your DBhelper

  await dbHelper.initDB(); // Initialize the database before running the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitPang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: TColor.primaryColor1,
          fontFamily: "Poppins"),
      home: const StartedView(),
    );
  }
}
