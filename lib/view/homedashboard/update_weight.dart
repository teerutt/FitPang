import 'package:fitpang/common_widget/weight_scrollwhell.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fitpang/view/maintab/maintab_view.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/dbhelper.dart';
import 'package:fitpang/common_widget/round_button.dart';

class UpdateWeight extends StatefulWidget {
  final int userId;
  const UpdateWeight({
    super.key,
    required this.userId,
  });

  @override
  State<UpdateWeight> createState() => _UpdateWeightState();
}

class _UpdateWeightState extends State<UpdateWeight> {
  int selectedWeight = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Center(
                child: WeightScrollWhell(
                  onWeightSelected: (weight) {
                    setState(() {
                      selectedWeight = weight;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
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
                  color: Colors.white, // Icon color
                ),
              ),
            ),
            Positioned(
              right: 15.0,
              top: 15.0,
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                ),
                padding: const EdgeInsets.all(0.25),
                child: IconButton(
                  icon: const Icon(Icons.home_outlined),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => MainTabView(
                            userId: widget
                                .userId),
                      ),
                    );
                  },
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: media.width * 0.05,
            ),
            Positioned(
              left: media.width * 0.6,
              top: media.height * 0.45,
              child: Text(
                "kg",
                style: TextStyle(
                    color: TColor.midGray,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              width: media.width,
              child: Column(
                children: [
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Text(
                    "What's your weight ?",
                    style: TextStyle(
                      color: TColor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "You have to update weekly",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: TColor.gray, fontSize: 12),
                  ),
                  const Spacer(),
                  Image.asset("assets/img/border_line.png"),
                  SizedBox(
                    height: media.width * 0.15,
                  ),
                  Image.asset("assets/img/border_line.png"),
                  const Spacer(),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  RoundButton(
                    title: "Next >",
                    onPressed: () async {
                      final db = await opendb();
                      final plan = await db.query('plan',
                          where: 'user_id = ?',
                          whereArgs: [widget.userId]);
                      final int height = plan.last['height'] as int;

                      final lastWeek = await getWeek(widget.userId);
                      String pattern = lastWeek['pattern_id'] as String;
                      double bmi =
                          (selectedWeight / ((height / 100) * (height / 100)));
                      bmi = double.parse(bmi.toStringAsFixed(2));
                      if (bmi < 18.5) {
                        pattern = pattern.replaceRange(3, 4, '1');
                      } else if (bmi >= 18.5 && bmi < 23) {
                        pattern = pattern.replaceRange(3, 4, '2');
                      } else if (bmi >= 23 && bmi < 25) {
                        pattern = pattern.replaceRange(3, 4, '3');
                      } else if (bmi >= 25 && bmi < 30) {
                        pattern = pattern.replaceRange(3, 4, '4');
                      } else {
                        pattern = pattern.replaceRange(3, 4, '5');
                      }

                      final week = Week(plan_id: plan.last['plan_id'] as int, week: (lastWeek['week'] as int)+1, weight: selectedWeight, pattern_id: pattern);
                    await db.insert('week', week.toMap(),conflictAlgorithm: ConflictAlgorithm.replace,);

                      final String gender = plan.last['sex'] as String;
                      final String goal = plan.last['program'] as String;
                      final int age = plan.last['age'] as int;
                      int bmr,tdee,protein,carb,fats;
                    if(gender == 'Male'){
                      bmr = ((selectedWeight * 10) + (height * 6.25) - (age * 5) + 5).round();
                    }else{
                      bmr = ((selectedWeight * 10) + (height * 6.25) - (age * 5) - 161).round();
                    }

                    final workoutDay = await db.rawQuery('SELECT COUNT(*) AS count FROM pattern_detail WHERE pattern_id = ? AND program1 != ?',[pattern,'Rest']);
                    final int workoutCount = Sqflite.firstIntValue(workoutDay) ?? 0;
                    if(workoutCount <= 2){
                      tdee = (bmr * 1.375).round(); // 1-2 days of exercise : TDEE = BMR * 1.375
                    }else if(workoutCount <= 5){
                      tdee = (bmr * 1.55).round();  // 3-5 days of exercise : TDEE = BMR * 1.55
                    }else{
                      tdee = (bmr * 1.725).round(); // 6-7 days of exercise : TDEE = BMR * 1.725
                    }

                    if(goal == 'Build Muscle'){
                      tdee += 500;
                    }else{
                      tdee -= 500;
                    }

                    protein = ((tdee * 0.3) / 4).round();
                    carb = ((tdee * 0.35) / 4).round();
                    fats = ((tdee * 0.35) / 9).round();

                    final thisWeek = await getWeek(widget.userId);
                    final nut = Nutrition(week_id: thisWeek['week_id'] as int, calories: tdee, protein: protein, carb: carb, fats: fats);
                    await db.insert('nutrition', nut.toMap(),conflictAlgorithm: ConflictAlgorithm.replace,);
                    db.close();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainTabView(userId: widget.userId,)));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
