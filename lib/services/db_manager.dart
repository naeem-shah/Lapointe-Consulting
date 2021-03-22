import 'dart:io';

import 'package:lapointeconsultingllc/assets/constants.dart';
import 'package:lapointeconsultingllc/models/user_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseManager {


  DatabaseManager._();

  static final DatabaseManager db = DatabaseManager._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _initDBFromCode();
    return _database;
  }

  Future<Database> _initDBFromCode() async {
    // getting path of root directory
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, Constants.database);


    // opening database if not created.
    var database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(Constants.usersSchema);
          print("Table Created");
        });

    return database;
  }


  Future<int> addUser(UserModel userModel) async {

    final db = await database;
    var raw = await db.insert(Constants.usersTable, userModel.toMap());
    return raw;
  }

  Future<int> updateUser(UserModel newClient) async {
    final db = await database;
    var res = await db.update(Constants.usersTable, newClient.toMap(),
        where: "${Constants.id} = ?", whereArgs: [newClient.id]);
    return res;
  }

  Future<bool> verifyUser(String email, String password) async {
    final db = await database;
    var usersMap = await db.rawQuery("Select * from ${Constants.usersTable} where "
        "${Constants.email} = ? AND ${Constants.password} = ?",[email, password]
    );

    if (usersMap.isNotEmpty){
      return true;
    }

    return false;
  }


  Future<int> deleteUser(int id) async {
    final db = await database;
    return db.delete(Constants.usersTable, where: "${Constants.id} = ?", whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    final db = await database;
    return db.rawDelete("Delete * from ${Constants.usersTable}");
  }
}