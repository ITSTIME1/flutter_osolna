import 'package:flutter/widgets.dart';
import 'package:osolna_application/memoRepository/memo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String _tableName = 'loveMemo';

class LoveDatabaseProvider extends ChangeNotifier {
  static dynamic _loveDatabase;

  // ignore: slash_for_doc_comments
  /**
   * [LoveDatabase Create]
   */

  Future<Database> get loveDatabase async {
    if (_loveDatabase != null) {
      return _loveDatabase;
    }
    _loveDatabase = openDatabase(
      join(await getDatabasesPath(), 'love.memo'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, content TEXT, dateTime TEXT)",
        );
      },
      version: 1,
    );
    return _loveDatabase;
  }
  // ignore: slash_for_doc_comments
  /**
   * [LoveDatabase Insert Memo]
   */

  Future<void> insertMemo(Memo memo) async {
    final hd = await loveDatabase;
    await hd.insert(
      _tableName,
      memo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    notifyListeners();
  }
  // ignore: slash_for_doc_comments
  /**
   * [LoveDatabase Delete Memo]
   */

  Future<void> deleteMemo(int id) async {
    final hd = await loveDatabase;

    await hd.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    notifyListeners();
  }

  // ignore: slash_for_doc_comments
  /**
   * [LoveDatabase Modify Memo] This Method changes that memo you wrote.
   */
  Future<void> updateLoveMemo(Memo memo) async {
    final hd = await loveDatabase;

    await hd.update(
      _tableName,
      memo.toMap(),
      where: 'id = ?',
      whereArgs: [memo.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    notifyListeners();
  }

  // ignore: slash_for_doc_comments
  /**
   * [LoveDatabase getALlData]
   */

  Future<List<Memo>> getLoveMemos() async {
    final hd = await loveDatabase;
    final List<Map<String, dynamic>> loveMaps = await hd.query(_tableName);
    notifyListeners();
    return List.generate(
      loveMaps.length,
      (index) {
        return Memo(
          id: loveMaps[index]['id'],
          title: loveMaps[index]['title'],
          content: loveMaps[index]['content'],
          dateTime: loveMaps[index]['dateTime'],
        );
      },
    );
  }

  Future<List<Memo>> findMemos(int id) async {
    final hd = await loveDatabase;

    final List<Map<String, dynamic>> loveFind = await hd.query(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    notifyListeners();
    return List.generate(
      loveFind.length,
      (index) {
        return Memo(
          id: loveFind[index]['id'],
          title: loveFind[index]['title'],
          content: loveFind[index]['content'],
          dateTime: loveFind[index]['dateTime'],
        );
      },
    );
  }
}
