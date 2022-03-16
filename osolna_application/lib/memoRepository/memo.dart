// ignore: slash_for_doc_comments
/**
 * [Memo Repository] This Repository is that when you want to write your memo
 * You can call this class Method.
 */
class Memo {
  final int? id;
  final String? title;
  final String? content;
  final String? dateTime;

  Memo({this.id, this.title, this.content, this.dateTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'dateTime': dateTime,
    };
  }

  @override
  String toString() {
    return '{$id, $title, $content, $dateTime}';
  }
}
