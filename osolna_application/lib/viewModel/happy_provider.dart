import 'package:flutter/cupertino.dart';
import 'package:osolna_application/memoRepository/memo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// ignore: slash_for_doc_comments
/**
 * [HappyDBHelper] This is only save that when you wrote happy memo.
 */

const String _tableName = 'happyMemo';

class HappyDatabaseProvider extends ChangeNotifier {
  static dynamic _happyDatabase;

  // ignore: slash_for_doc_comments
  /**
   * [HappyDatabase Create]
   */
  Future<Database> get happyDatabase async {
    if (_happyDatabase != null) {
      return _happyDatabase;
    }
    _happyDatabase = openDatabase(
      join(await getDatabasesPath(), 'happy.memo'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, content TEXT, dateTime TEXT)",
        );
      },
      version: 1,
    );
    return _happyDatabase;
  }

  // ignore: slash_for_doc_comments
  /**
   * [HappyDatabase Insert Memo] this Method is used that you want to insert memo at _tabeName
   */
  Future<void> insertMemo(Memo memo) async {
    final hd = await happyDatabase;
    await hd.insert(
      _tableName,
      memo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    notifyListeners();
  }

  // ignore: slash_for_doc_comments
  /**
   * [HappyDatabase Delete Memo] This Method is used that you want to delete Memo at _tableName
   */

  Future<void> deleteMemo(int id) async {
    final hd = await happyDatabase;

    await hd.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    notifyListeners();
  }

  // ignore: slash_for_doc_comments
  /**
   * [HappyDatabase Modify Memo]
   */
  Future<void> updateHappyMemo(Memo memo) async {
    final hd = await happyDatabase;

    await hd.update(
      _tableName,
      memo.toMap(),
      where: 'id = ?',
      whereArgs: [memo.id],
    );
    notifyListeners();
  }

  // ignore: slash_for_doc_comments
  /**
   * [HappyDatabase getAllData] This Method show _tableName mood memo list.
   */

  Future<List<Memo>> getHappyMemos() async {
    final hd = await happyDatabase;
    final List<Map<String, dynamic>> happyMaps = await hd.query(_tableName);
    notifyListeners();
    return List.generate(
      happyMaps.length,
      (index) {
        return Memo(
          id: happyMaps[index]['id'],
          title: happyMaps[index]['title'],
          content: happyMaps[index]['content'],
          dateTime: happyMaps[index]['dateTime'],
        );
      },
    );
  }

  Future<List<Memo>> findMemos(int id) async {
    final hd = await happyDatabase;

    final List<Map<String, dynamic>> happyFind = await hd.query(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    notifyListeners();
    return List.generate(
      happyFind.length,
      (index) {
        return Memo(
          id: happyFind[index]['id'],
          title: happyFind[index]['title'],
          content: happyFind[index]['content'],
          dateTime: happyFind[index]['dateTime'],
        );
      },
    );
  }
}
