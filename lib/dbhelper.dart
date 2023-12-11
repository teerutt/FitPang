// ignore_for_file:non_constant_identifier_names

import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {
  Future initDB() async {
    final dbpath = await getDatabasesPath();
    final path = join(dbpath, "fitpang_DB.db");

    final exist = await databaseExists(path);
    if (exist) {
      print("DB exists at $path");
      openDatabase(path);
    } else {
      print("creating a copy from assets at $path");

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", "fitpang_DB.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);

      print("db copied to $path.");
    }
  }
}

Future<List<String>> listTables(Database database) async {
  // The query to retrieve table names from the SQLite database.
  final result = await database
      .rawQuery("SELECT name FROM sqlite_master WHERE type='table'");

  // Extract table names from the query result.
  final tableNames = result.map((row) => row['name'] as String).toList();

  return tableNames;
}

class User {
  int? user_id;
  String f_name;
  String l_name;
  String email;
  String password;
  String DOB;

  User(
      {this.user_id,
      required this.f_name,
      required this.l_name,
      required this.email,
      required this.password,
      required this.DOB});

  Map<String, dynamic> toMap() {
    return {
      'user_id': user_id,
      'f_name': f_name,
      'l_name': l_name,
      'email': email,
      'password': password,
      'DOB': DOB,
    };
  }
}

class Plan {
  int? plan_id;
  int user_id;
  String program;
  int height;
  String sex;
  int age;
  int plan_period;
  DateTime date_created;

  Plan({
    this.plan_id,
    required this.user_id,
    required this.program,
    required this.height,
    required this.sex,
    required this.age,
    required this.plan_period,
    required this.date_created,
  });

  Map<String, dynamic> toMap() {
    return {
      'plan_id': plan_id,
      'user_id': user_id,
      'program': program,
      'height': height,
      'sex': sex,
      'age': age,
      'plan_period': plan_period,
      'date_created': date_created.toIso8601String(),
    };
  }
}

class Week {
  int? week_id;
  int plan_id;
  int week;
  int weight;
  String pattern_id;

  Week({
    this.week_id,
    required this.plan_id,
    required this.week,
    required this.weight,
    required this.pattern_id,
  });

  Map<String, dynamic> toMap() {
    return {
      'week_id': week_id,
      'plan_id': plan_id,
      'week': week,
      'weight': weight,
      'pattern_id': pattern_id,
    };
  }
}

class Nutrition {
  int week_id;
  int calories;
  int protein;
  int carb;
  int fats;

  Nutrition({
    required this.week_id,
    required this.calories,
    required this.protein,
    required this.carb,
    required this.fats,
  });

  Map<String, dynamic> toMap() {
    return {
      'week_id': week_id,
      'calories': calories,
      'protein': protein,
      'carb': carb,
      'fats': fats,
    };
  }
}

Future<Database> opendb() async {
  final dbpath = await getDatabasesPath();
  final path = join(dbpath, "fitpang_DB.db");
  final db = await openDatabase(path);
  return db;
}

Future<void> printAllUser() async {
  final db = await opendb();
  List<Map> list = await db.rawQuery('SELECT * FROM user_account');
  print('Available user: $list');
}

Future<void> insertUser(User user) async {
  final dbpath = await getDatabasesPath();
  final path = join(dbpath, "fitpang_DB.db");
  final db = await openDatabase(path);
  final tables = await listTables(db);

  for (final table in tables) {
    print("Table: $table");
  }

  try {
    print("User data before insertion:");
    print("user_id: ${user.user_id}");
    print("email: ${user.email}");
    print("password: ${user.password}");
    print("f_name: ${user.f_name}");
    print("l_name: ${user.l_name}");
    print("DOB: ${user.DOB}");

    await db.insert(
      'user_account',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("Inserted $user to $path");

    List<Map> list = await db.rawQuery('SELECT * FROM user_account');
    print('list: $list');
  } catch (e) {
    print("Error inserting user: $e");
  }
  print('done');
  await db.close();
}

Future<String> getFirstName(int userId) async {
  final db = await opendb();
  final result =
      await db.query('user_account', where: 'user_id = ?', whereArgs: [userId]);
  //await db.close();

  return result.first['f_name']
      as String; // Replace '' with a default value if f_name is nullable
}

Future<String> getLastName(int userId) async {
  final db = await opendb();
  final result =
      await db.query('user_account', where: 'user_id = ?', whereArgs: [userId]);
  await db.close();

  return result.first['l_name']
      as String; // Replace '' with a default value if f_name is nullable
}

Future<Map<String, dynamic>> getUser(int userId) async {
  final db = await opendb();
  final result =
      await db.query('user_account', where: 'user_id = ?', whereArgs: [userId]);
  await db.close();

  return result.first; // Replace '' with a default value if f_name is nullable
}

Future<double> calculateBMI(int userId) async {
  final db = await opendb();
  final plan = await db.query('plan',
      columns: ['plan_id', 'height'],
      where: 'user_id = ?',
      whereArgs: [userId]);
  final int planId = plan.last['plan_id'] as int;
  final int height = plan.last['height'] as int;
  final int weight = (await db.query('week',
          columns: ['weight'], where: 'plan_id = ?', whereArgs: [planId]))
      .last['weight'] as int;

  double bmi = (weight / ((height / 100) * (height / 100)));
  bmi = double.parse(bmi.toStringAsFixed(2));
  return bmi;
}

Future<DateTime> getPlanDate(int userId) async {
  final db = await opendb();
  final planDate = (await db.query('plan',
          columns: ['date_created'], where: 'user_id = ?', whereArgs: [userId]))
      .first['date_created'] as String;
  return DateTime.parse(planDate);
}

Future<Map<String, Object?>> getPlan(int userId) async {
  final db = await opendb();
  final plan =
      await db.query('plan', where: 'user_id = ?', whereArgs: [userId]);
  return plan.last;
}

Future<int> getDay(int userId) async {
  final planDate = await getPlanDate(userId);
  return DateTime.now().difference(planDate).inDays + 1;
}

Future<String> getProgram(int userId, int programNo) async {
  final db = await opendb();
  int planId = (await getPlan(userId))['plan_id'] as int;
  int day = await getDay(userId);
  final pattern = (await db.query('week',
          columns: ['pattern_id'], where: 'plan_id = ?', whereArgs: [planId]))
      .last['pattern_id'] as String;
  final program = await db.query('pattern_detail',
      columns: ['program$programNo'],
      where: 'pattern_id = ? AND day = ?',
      whereArgs: [pattern, (day % 7) == 0 ? 7 : day % 7]);
  if (program.first['program$programNo'] != null) {
    return program.first['program$programNo'] as String;
  } else {
    return '';
  }
}

Future<Uint8List> getImage(String ex_code) async {
  final db = await opendb();
  final result = (await db.query('exercise',
      columns: ['picture'], where: 'ex_code = ?', whereArgs: [ex_code]));
  return result.first['picture'] as Uint8List;
}

Future<Uint8List> getPVImage(String ex_code) async {
  final db = await opendb();
  final result = (await db.query('exercise',
      columns: ['pv'], where: 'ex_code = ?', whereArgs: [ex_code]));
  return result.first['pv'] as Uint8List;
}

Future<List<Map<String, Object?>>> getExbymuscle(
    String muscle, String? pattern) async {
  final db = await opendb();
  List<Map<String, Object?>> result;
  if (pattern != null && '145'.contains(pattern[2])) {
    result = await db.query('exercise',
        where: 'ex_code LIKE ? AND type = ?',
        whereArgs: ['$muscle%', 'bodyweight']);
  } else {
    result = await db
        .query('exercise', where: 'ex_code LIKE ?', whereArgs: ['$muscle%']);
  }
  return result;
}

Future<Map<String, Object?>> getExbycode(String code, String? pattern) async {
  final db = await opendb();
  List<Map<String, Object?>> result;
  if (pattern != null && '145'.contains(pattern[2])) {
    result = await db.query('exercise',
        where: 'ex_code = ? AND type = ?', whereArgs: [code, 'bodyweight']);
  } else {
    result =
        await db.query('exercise', where: 'ex_code = ?', whereArgs: [code]);
  }
  return result.first;
}

Future<Map<String, Object?>> getWeek(int userId) async {
  final db = await opendb();
  final planId = (await getPlan(userId))['plan_id'] as int;
  final result =
      await db.query('week', where: 'plan_id = ?', whereArgs: [planId]);
  return result.last;
}

Future<Map<String, Object?>> getNut(int userId) async {
  final db = await opendb();
  final week = (await getWeek(userId))['week'];
  final result =
      await db.query('nutrition', where: 'week_id = ?', whereArgs: [week]);
  return result.last;
}

Future<Map<String, Object?>> getEvent(int userId) async {
  final db = await opendb();
  final result = await db.query('event',
      columns: ['name', 'description', 'pic2'],
      where: 'event_id = ?',
      whereArgs: [userId]);
  return result.first;
}

Future<List<Map<String, Object?>>> queryEvent() async {
  final db = await opendb();
  final result = await db
      .query('event', columns: ['event_id', 'name', 'description', 'pic1']);
  return result;
}

Future<void> deletePlan(int id) async {
  final db = await opendb();
  final planId = (await getPlan(id))['plan_id'];
  final weekId = (await getWeek(id))['week_id'];
  await db.delete('plan', where: 'plan_id = ?', whereArgs: [planId]);
  await db.delete('week', where: 'plan_id = ?', whereArgs: [planId]);
  await db.delete('nutrition', where: 'week_id = ?', whereArgs: [weekId]);
}

Future<void> updateProfile(int id, String f_name, String l_name) async {
  final db = await opendb();
  await db.rawUpdate(
      'UPDATE user_account SET f_name = ?, l_name = ? WHERE user_id = ?',
      [f_name, l_name, '$id']);
}
