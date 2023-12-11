import 'package:fitpang/dbhelper.dart';
import 'package:flutter/material.dart';
import 'package:fitpang/common/color_extension.dart';
import 'package:fitpang/common_widget/round_button.dart';
import 'package:fitpang/view/maintab/maintab_view.dart';
import 'package:sqflite/sqflite.dart';

class CompleteCreate extends StatefulWidget {
  final int userId;
  final String gender;
  final int age;
  final int height;
  final int weight;
  final String goal;
  final int current_body;
  final int desired_body;
  final int period;
  const CompleteCreate(
      {super.key,
      required this.userId,
      required this.gender,
      required this.age,
      required this.height,
      required this.weight,
      required this.goal,
      required this.current_body,
      required this.desired_body,
      required this.period});

  @override
  State<CompleteCreate> createState() => _CompleteCreateState();
}

class _CompleteCreateState extends State<CompleteCreate> {

  @override
  Widget build(BuildContext context) {
    int level=0,bmr,tdee,protein,fats,carb;
    String pattern = '';
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: media.width * 0.1,
              ),
               Image.asset(
                "assets/img/welcome.png",
                width: media.width * 0.75,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
              Text(
                "Plan created succesfully !",
                style: TextStyle(
                    color: TColor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "You are all set now, let’s reach your\ngoals together with us",
                textAlign: TextAlign.center,
                style: TextStyle(color: TColor.gray, fontSize: 12),
              ),
             const Spacer(),

               RoundButton(
                  title: "Done",
                  onPressed: () async {
                    final plan = Plan(user_id: widget.userId, program: widget.goal, height: widget.height, sex: widget.gender, age: widget.age, plan_period: widget.period, date_created: DateTime.now(),);
                    final db = await opendb();
                    await db.insert('plan', plan.toMap(),conflictAlgorithm: ConflictAlgorithm.replace,);
                    print('${widget.userId}\n${widget.goal}\n${widget.height}\n${widget.gender}\n${widget.age}\n${widget.current_body}\n${widget.desired_body}\n${widget.period}');
                    final plan_id = await db.query('plan', columns: ['plan_id'], where: 'user_id = ?', whereArgs: [widget.userId]);

                    double bmi = (widget.weight / ((widget.height/100)*(widget.height/100)));
                    switch(widget.current_body){
                      case 0:
                        if(widget.period > 6){
                          level = 1;
                        }else if(widget.period > 2){
                          level = 2;
                        }else{
                          level = 3;
                        }
                      case 1:
                        if(widget.period == 10){
                          level = 1;
                        }else if(widget.period>4){
                          level = 2;
                        }else{
                          level = 3;
                        }
                      case 2:
                      switch(widget.period){
                          case 10:
                            level = 1;
                          case 8:
                            level = 2;
                          default:
                            level = 3;
                        }
                    }

                    widget.goal=='Build Muscle'? pattern+='B' : pattern+='L';
                    widget.gender=='Male'? pattern+='M' : pattern+='F';
                    if(widget.age < 18) {
                      pattern+='1';
                    }else if(widget.age >= 18 && widget.age <= 30){
                      pattern+='2';
                    }else if(widget.age >= 31 && widget.age <= 45){
                      pattern+='3';
                    }else if(widget.age >= 46 && widget.age <= 60){
                      pattern+='4';
                    }else{
                      pattern+='5';
                    }

                    if(bmi < 18.5){
                      pattern+='1';
                    }else if(bmi >= 18.5 && bmi < 23){
                      pattern+='2';
                    }else if(bmi >= 23 && bmi < 25){
                      pattern+='3';
                    }else if(bmi >= 25 && bmi < 30){
                      pattern+='4';
                    }else{
                      pattern+='5';
                    }
                    
                    pattern+='$level';
                    print('pattern=$pattern');

                    final week = Week(plan_id: plan_id.last['plan_id'] as int, week: 1, weight: widget.weight, pattern_id: pattern);
                    await db.insert('week', week.toMap(),conflictAlgorithm: ConflictAlgorithm.replace,);

                    if(widget.gender == 'Male'){
                      bmr = ((widget.weight * 10) + (widget.height * 6.25) - (widget.age * 5) + 5).round();
                    }else{
                      bmr = ((widget.weight * 10) + (widget.height * 6.25) - (widget.age * 5) - 161).round();
                    }

                    final workout_day = await db.rawQuery('SELECT COUNT(*) AS count FROM pattern_detail WHERE pattern_id = ? AND program1 != ?',[pattern,'Rest']);
                    final int workout_count = Sqflite.firstIntValue(workout_day) ?? 0;
                    if(workout_count <= 2){
                      tdee = (bmr * 1.375).round(); // 1-2 days of exercise : TDEE = BMR * 1.375
                    }else if(workout_count <= 5){
                      tdee = (bmr * 1.55).round();  // 3-5 days of exercise : TDEE = BMR * 1.55
                    }else{
                      tdee = (bmr * 1.725).round(); // 6-7 days of exercise : TDEE = BMR * 1.725
                    }

                    if(widget.goal == 'Build Muscle'){
                      tdee += 500;
                    }else{
                      tdee -= 500;
                    }

                    protein = ((tdee * 0.3) / 4).round();
                    carb = ((tdee * 0.35) / 4).round();
                    fats = ((tdee * 0.35) / 9).round();

                    final week_id = await db.query('week', columns: ['week_id'], where: 'plan_id = ?', whereArgs: [plan_id.last['plan_id'] as int]);
                    final nut = Nutrition(week_id: week_id.first['week_id'] as int, calories: tdee, protein: protein, carb: carb, fats: fats);
                    await db.insert('nutrition', nut.toMap(),conflictAlgorithm: ConflictAlgorithm.replace,);

                    db.close();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MainTabView(userId: widget.userId,)));
                  }),
               
            ],
          ),
        ),

      ),
    );
  }
}