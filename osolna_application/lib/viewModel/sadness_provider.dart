import 'package:flutter/widgets.dart';
import 'package:osolna_application/memoRepository/memo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const String _tableName = 'sadnessMemo';

class SadnessDatabaseProvider extends ChangeNotifier {
  static dynamic _sadnessDatabase;

  // ignore: slash_for_doc_comments
  /**
   * [SadnessDatabase Create]
   */

  Future<Database> get sadnessDatabase async {
    if (_sadnessDatabase != null) {
      return _sadnessDatabase;
    }
    _sadnessDatabase = openDatabase(
      join(await getDatabasesPath(), 'sad.memo'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, content TEXT, dateTime TEXT)",
        );
      },
      version: 1,
    );
    return _sadnessDatabase;
  }
  // ignore: slash_for_doc_comments
  /**
   * [SadnessDatabase Insert Memo]
   */

  Future<void> insertMemo(Memo memo) async {
    final hd = await sadnessDatabase;
    await hd.insert(
      _tableName,
      memo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    notifyListeners();
  }
  // ignore: slash_for_doc_comments
  /**
   * [SadnessDatabase Delete Memo]
   */

  Future<void> deleteMemo(int id) async {
    final hd = await sadnessDatabase;

    await hd.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    notifyListeners();
  }

  // ignore: slash_for_doc_comments
  /**
   * [SadnessDatabase Modify Memo] This Method changes that memo you wrote.
   */
  Future<void> updateSadnessMemo(Memo memo) async {
    final hd = await sadnessDatabase;

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
   * [SadnessDatabase getALlData]
   */

  Future<List<Memo>> getSadnessMemos() async {
    final hd = await sadnessDatabase;
    final List<Map<String, dynamic>> sadnessMaps = await hd.query(_tableName);
    notifyListeners();
    return List.generate(
      sadnessMaps.length,
      (index) {
        return Memo(
          id: sadnessMaps[index]['id'],
          title: sadnessMaps[index]['title'],
          content: sadnessMaps[index]['content'],
          dateTime: sadnessMaps[index]['dateTime'],
        );
      },
    );
  }

  Future<List<Memo>> findMemos(int id) async {
    final hd = await sadnessDatabase;

    final List<Map<String, dynamic>> sadNessFind = await hd.query(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
    notifyListeners();
    return List.generate(
      sadNessFind.length,
      (index) {
        return Memo(
          id: sadNessFind[index]['id'],
          title: sadNessFind[index]['title'],
          content: sadNessFind[index]['content'],
          dateTime: sadNessFind[index]['dateTime'],
        );
      },
    );
  }
}
