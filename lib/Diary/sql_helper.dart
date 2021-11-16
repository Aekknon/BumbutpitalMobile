import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE items1(
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        title TEXT,
        description TEXT,
        createdAt TEXT,
        userID TEXT,
        sensitivePoint TEXT,
      )
      """);
  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite

  static Future<sql.Database> db() async {
    return sql.openDatabase('kindacode1.db', version: 3,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    }, onUpgrade: (sql.Database db, int oldV, int newV) async {
      if (oldV < newV) {
        await db.execute('alter table items1 add column countBadDiary TEXT');
      }
    });
  }

  // Create new item (journal)
  // ignore: non_constant_identifier_names
  static Future<int> createItem(String title, String? descrption,
      String createdAt, String userID, String sensitivePoint , String countBadDiary) async {
    final db = await SQLHelper.db();
    final now = new DateTime.now();
    String Day = DateFormat.yMMMMd('en_US').format(now);
    String Time = new DateFormat.jm().format(now);

    final data = {
      'title': title,
      'description': descrption,
      'createdAt': createdAt,
      'userID': userID,
      'sensitivePoint': sensitivePoint,
      'countBadDiary': countBadDiary,
    };
    final id = await db.insert('items1', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('items1', orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('items1', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem(int id, String title, String? descrption,
      String createdAt, String userID, String sensitivePoint, String countBadDiary) async {
    final db = await SQLHelper.db();

    final data = {
      'title': title,
      'description': descrption,
      'createdAt': createdAt,
      'userID': userID,
      'sensitivePoint': sensitivePoint,
      'countBadDiary': countBadDiary
    };

    final result =
        await db.update('items1', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("items1", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}
