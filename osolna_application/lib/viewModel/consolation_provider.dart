import 'package:flutter/cupertino.dart';
import 'package:osolna_application/memoRepository/memo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// ignore: slash_for_doc_comments
/**
 * [Consolation DBHelper] This is only save that when you wrote happy memo.
 */

const String _tableName = 'consolationMemo';

class ConsolationDatabaseProvider extends ChangeNotifier {
  static dynamic _consolationDatabase;

  // ignore: slash_for_doc_comments
  /**
   * [ConsolationDatabase Create]
   */
  Future<Database> get consolationDatabase async {
    if (_consolationDatabase != null) {
      return _consolationDatabase;
    }
    _consolationDatabase = openDatabase(
      join(await getDatabasesPath(), 'consolation.memo'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, content TEXT, dateTime TEXT)",
        );
      },
      version: 1,
    );
    return _consolationDatabase;
  }

  // ignore: slash_for_doc_comments
  /**
   * [ConsolationDatabase Insert Memo] this Method is used that you want to insert memo at _tabeName
   */
  Future<void> insertMemo(Memo memo) async {
    final hd = await consolationDatabase;
    await hd.insert(
      _tableName,
      memo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    notifyListeners();
  }

  // ignore: slash_for_doc_comments
  /**
   * [ConsolationDatabase Delete Memo] This Method is used that you want to delete Memo at _tableName
   */

  Future<void> deleteMemo(int id) async {
    final hd = await consolationDatabase;

    await hd.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    notifyListeners();
  }

  // ignore: slash_for_doc_comments
  /**
   * [ConsolationDatabase getAllData] This Method is used for ListViewBuilder.
   */

  Future<List<Memo>> getConsolationMemos() async {
    final hd = await consolationDatabase;
    final List<Map<String, dynamic>> consolationMaps =
        await hd.query(_tableName);
    notifyListeners();
    return List.generate(
      consolationMaps.length,
      (index) {
        return Memo(
          id: consolationMaps[index]['id'],
          title: consolationMaps[index]['title'],
          content: consolationMaps[index]['content'],
          dateTime: consolationMaps[index]['dateTime'],
        );
      },
    );
  }
}
