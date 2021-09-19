class TempTaskClass {
  var _id;
  String _title = '';
  bool _isDone = false;
  TempTaskClass(dynamic obj) {
    _id = obj['id'];
    _title = obj['title'];
    _isDone = obj['isDone'];
    print('id= $_id, title= $title, isDone= $_isDone');
  }

  TempTaskClass.fromMap(Map<String, dynamic> data) {
    _id = data['id'];
    _title = data['title'];
    _isDone = data['isDone'];
  }

  Map<String, dynamic> toMap() =>
      {'id': _id, 'title': _title, 'isDone': _isDone};

  int get id => _id;
  String get title => _title;
  bool get isDone => _isDone;
}
