import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as path;
import 'package:rare_crew_task_cynthia/data/model/db_model.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

class DatabaseServices {
  static Future<Database> database() async {
    //get a database path
    final dbPath = await sql.getDatabasesPath();
    //open the database
    return sql.openDatabase(
      path.join(dbPath, 'rarecrew.db'),
      //creating the database table
      onCreate: (db, version) {
        return db.execute('''CREATE TABLE rare_crew (
          id TEXT PRIMARY KEY, 
          name TEXT, 
          occupation TEXT, 
          age INTEGER)''');
      },
      version: 1,
    );
  }

//creating a function that enables us add an item to the database
  Future<void> addItem(String table, Map<String, Object> data) async {
    print(data);
    final db = await DatabaseServices.database();
    var rawData = db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
    print(rawData);
  }

  //creating a function to enable us retrieve/fetch all items in the database
  Future<List<Map<String, dynamic>>> fetchDbData(String table) async {
    final db = await DatabaseServices.database();
    return db.query(table);
  }

  //creating a function that updates item in the database
   Future<int> updateDB(DBModel dbModel) async {
    final db = await DatabaseServices.database();
    return await db.update("rare_crew", dbModel.toMap(),
        where: "id = ?", whereArgs: [dbModel.id]);
  }

  //creating a function to enable us delete an item from the database
  Future<void> delete(String id) async {
    final db = await DatabaseServices.database();
    db.delete("rare_crew", where: "id = ?", whereArgs: [id]);
  }
}

//initializing a provider to make our db functions accessible in the app state
final dbServicesProvider = Provider((ref) => DatabaseServices());
