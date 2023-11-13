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

Future<Database> opendb() async{
  final dbpath = await getDatabasesPath();
  final path = join(dbpath, "fitpang_DB.db");
  final db = await openDatabase(path);
  return db;
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
  final result = await db.query('user_account', where: 'user_id = ?', whereArgs: [userId]);
  await db.close();

return result.first['f_name'] as String; // Replace '' with a default value if f_name is nullable
}

Future<String> getLastName(int userId) async {
  final db = await opendb();
  final result = await db.query('user_account', where: 'user_id = ?', whereArgs: [userId]);
  await db.close();

return result.first['l_name'] as String; // Replace '' with a default value if f_name is nullable
}

Future<Map<String,dynamic>> getUser(int userId) async {
  final db = await opendb();
  final result = await db.query('user_account', where: 'user_id = ?', whereArgs: [userId]);
  await db.close();

return result.first; // Replace '' with a default value if f_name is nullable
}