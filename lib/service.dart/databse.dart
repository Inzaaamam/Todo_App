import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;
// ignore: non_constant_identifier_names
class SQLHelper {
 static Future<void> createTables(sql.Database database) async {
    await database.execute('''
          CREATE TABLE Note (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            age INT,
            address TEXT,
            profession TEXT
          )
        ''');
  }

 static Future<sql.Database> db() async {
    return sql.openDatabase(
      'note_db.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        print('...database');
        await createTables(database);
      },
    );
  }

  static Future<int> createItems(
      String name, int age, String address, String profession,) async {
    final db = await SQLHelper.db();
    final data = {
      'name': name,
      'age': age,
      'address': address,
      'profession': profession
    };
    final id = await db.insert('Note', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('Note', orderBy: "id");
  }
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('Note', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateItem(
      int id, String name, int age, String address, String profession) async {
    final db = await SQLHelper.db();

    final data = {
      'name': name,
      'age': age,
      'address': address,
      'profession': profession
    };

    final result =
        await db.update('Note', data, where: "id = ?", whereArgs: [id]);
    return result;
  }
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("Note", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
// class DataBaseHelper {
//   static const int version = 1;
//   // ignore: constant_identifier_names
//   static const String _dbName = 'Note_db';

//   static Future<Database> _getDB() async {
//     return openDatabase(join(await getDatabasesPath(), _dbName),
//         onCreate: (db, version) async => (await db.execute('''
//       CREATE TABLE $_dbName (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         name TEXT,
//         age INT,
//         address TEXT,
//         profession TEXT
//       )
//     ''')), version: version);
//   }

//   static Future<int> insertData(Note note) async {
//     final db = await _getDB();
//     return await db.insert('Note', note.toJson());
//   }

//   static Future<int> addNote(Note note) async {
//     final db = await _getDB();
//     return await db.insert('Note', note.toJson(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   static Future<int> updateNote(Note note) async {
//     final db = await _getDB();
//     return await db.update('Note', note.toJson(),
//         where: 'id = ?',
//         whereArgs: [note.id],
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   static Future<int> deleteNote(Note note) async {
//     final db = await _getDB();
//     return await db.delete(
//       'Note',
//       where: 'id = ?',
//       whereArgs: ['id'],
//     );
//   }

//   static Future<List<Note>> getNotes() async {
//     final db = await _getDB();
//     final List<Map<String, dynamic>> maps = await db.query('Note');
//     if (maps.isEmpty) {
//       return [];
//     }
//     return List.generate(maps.length, (index) => Note.fromJson(maps[index]));
//   }
// }
