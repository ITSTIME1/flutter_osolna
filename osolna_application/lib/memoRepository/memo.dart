class Memo {
  final int? id;
  final String? title;
  final String? content;
  final DateTime? dateTime;

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
