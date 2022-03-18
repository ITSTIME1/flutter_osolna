import 'package:flutter/widgets.dart';
import 'package:osolna_application/memoRepository/memo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String _tableName = 'simpleMemo';

class SimpleMemoDatabaseProvider extends ChangeNotifier {
  static dynamic _simpleMemo;

  // ignore: slash_for_doc_comments
  /**
   * [SimpleMemoDatabase Create]
   */

  Future<Database> get simpleMemoDatabase async {
    if (_simpleMemo != null) {
      return _simpleMemo;
    }
    _simpleMemo = openDatabase(
      join(await getDatabasesPath(), 'simple.memo'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, content TEXT, dateTime TEXT)",
        );
      },
      version: 1,
    );
    return _simpleMemo;
  }
  // ignore: slash_for_doc_comments
  /**
   * [SimpleMemoDatabase Insert Memo]
   */

  Future<void> insertMemo(Memo memo) async {
    final hd = await simpleMemoDatabase;
    await hd.insert(
      _tableName,
      memo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    notifyListeners();
  }
  // ignore: slash_for_doc_comments
  /**
   * [SimpleMemoDatabase Delete Memo]
   */

  Future<void> deleteMemo(int id) async {
    final hd = await simpleMemoDatabase;

    await hd.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    notifyListeners();
  }

  // ignore: slash_for_doc_comments
  /**
   * [SimpleDatabase Modify Memo] This Method changes that memo you wrote.
   */
  Future<void> updateSimpleMemo(Memo simpleMemo) async {
    final hd = await simpleMemoDatabase;

    await hd.update(
      _tableName,
      simpleMemo.toMap(),
      where: 'id = ?',
      whereArgs: [simpleMemo.id],
    );
    notifyListeners();
  }

  // ignore: slash_for_doc_comments
  /**
   * [SimpleMemoDatabase getALlData]
   */

  Future<List<Memo>> getSimpleMemos() async {
    final hd = await simpleMemoDatabase;
    final List<Map<String, dynamic>> simpleMaps = await hd.query(_tableName);
    notifyListeners();
    return List.generate(
      simpleMaps.length,
      (index) {
        return Memo(
          id: simpleMaps[index]['id'],
          title: simpleMaps[index]['title'],
          content: simpleMaps[index]['content'],
          dateTime: simpleMaps[index]['dateTime'],
        );
      },
    );
  }

  Future<List<Memo>> findSimpleMemos(int id) async {
    final hd = await simpleMemoDatabase;

    final List<Map<String, dynamic>> simpleFind = await hd.query(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    notifyListeners();
    return List.generate(
      simpleFind.length,
      (index) {
        return Memo(
          id: simpleFind[index]['id'],
          title: simpleFind[index]['title'],
          content: simpleFind[index]['content'],
          dateTime: simpleFind[index]['dateTime'],
        );
      },
    );
  }
}
