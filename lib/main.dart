import 'package:flutter/material.dart';
import 'package:fitpang/view/onboarding/started_view.dart';
import 'package:fitpang/dbhelper.dart';
import 'common/color_extension.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized();
  final dbHelper = DBhelper();

  await dbHelper.initDB(); // Initialize the database before running the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitPang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: TColor.primaryColor1,
          fontFamily: "Poppins"),
      home: const StartedView(),
    );
  }
}
