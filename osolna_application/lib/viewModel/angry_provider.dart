import 'package:flutter/cupertino.dart';
import 'package:osolna_application/memoRepository/memo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// ignore: slash_for_doc_comments
/**
 * [AngryDBHelper] This is only save that when you wrote happy memo.
 */

const String _tableName = 'angryMemo';

class AngryDatabaseProvider extends ChangeNotifier {
  static dynamic _angryDatabase;

  // ignore: slash_for_doc_comments
  /**
   * [AngryDatabase Create]
   */
  Future<Database> get angryDatabase async {
    if (_angryDatabase != null) {
      return _angryDatabase;
    }
    _angryDatabase = openDatabase(
      join(await getDatabasesPath(), 'angry.memo'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, content TEXT, dateTime TEXT)",
        );
      },
      version: 1,
    );
    return _angryDatabase;
  }

  // ignore: slash_for_doc_comments
  /**
   * [AngryDatabase Insert Memo] this Method is used that you want to insert memo at _tabeName
   */
  Future<void> insertMemo(Memo memo) async {
    final hd = await angryDatabase;
    await hd.insert(
      _tableName,
      memo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    notifyListeners();
  }

  // ignore: slash_for_doc_comments
  /**
   * [AngryDatabase Delete Memo] This Method is used that you want to delete Memo at _tableName
   */

  Future<void> deleteMemo(int id) async {
    final hd = await angryDatabase;

    await hd.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    notifyListeners();
  }

  // ignore: slash_for_doc_comments
  /**
   * [AngryDatabase getAllData] This Method is used for ListViewBuilder.
   */

  Future<List<Memo>> getAngryMemos() async {
    final hd = await angryDatabase;
    final List<Map<String, dynamic>> angryMaps = await hd.query(_tableName);
    notifyListeners();
    return List.generate(
      angryMaps.length,
      (index) {
        return Memo(
          id: angryMaps[index]['id'],
          title: angryMaps[index]['title'],
          content: angryMaps[index]['content'],
          dateTime: angryMaps[index]['dateTime'],
        );
      },
    );
  }
}
