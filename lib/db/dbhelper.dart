// ignore_for_file: unnecessary_null_comparison, constant_identifier_names, depend_on_referenced_packages, prefer_is_empty, import_of_legacy_library_into_null_safe, null_check_always_fails, prefer_typing_uninitialized_variables

import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import '../models/usermodel.dart';

class DbHelper {
  static Database? _database;

  static const String DB_Name = 'test.db';
  static const String Table_User = 'user';
  static const int version = 1;

  static const String C_Name = 'name';
  static const String C_UserName = 'username';
  static const String C_Email = 'email';
  static const String C_Year = 'year';
  static const String C_Password = 'password';

  Future<Database> get db async {
    if (_database == null) {
      _database = await initDb();
    } else {
      return _database!;
    }
    return _database!;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db;
    db = await openDatabase(path, version: version, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int intVersion) async {
    await db.execute("CREATE TABLE $Table_User ("
        "$C_UserName TEXT,"
        "$C_Name TEXT,"
        "$C_Email TEXT,"
        "$C_Year TEXT,"
        "$C_Password TEXT,"
        "PRIMARY KEY ($C_UserName)"
        ")");
  }

  Future<int> saveData(UserModel user) async {
    final dbClient = await db;
    final res = await dbClient.insert(Table_User, user.toMap());
    return res;
  }

  Future<UserModel> getLoginUser(String username, String password) async {
    final dbClient = await db;
    final res = await dbClient.rawQuery("SELECT * FROM $Table_User WHERE "
        "$C_UserName = '$username' AND "
        "$C_Password = '$password'");
    if (res.length > 0) {
      return UserModel.fromMap(res.first);
    }

    return null!;
  }

  Future<int> updateUser(UserModel user) async {
    var dbClient = await db;
    var res = await dbClient.update(Table_User, user.toMap(),
        where: "$C_UserName = ?", whereArgs: [user.username]);
    return res;
  }

  Future<int> deleteUser(String username) async {
    var dbClient = await db;
    var res = await dbClient
        .delete(Table_User, where: "$C_UserName = ?", whereArgs: [username]);
    return res;
  }
}
