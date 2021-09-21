class Task {
  late final String title;
  late bool isDone;
  var id;
  Task({required this.title, this.isDone = false});
  void toggleDone() {
    isDone = !isDone;
  }

  Task.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    isDone = false;
  }

  Map<String, dynamic> toMap() => {'id': id, 'title': title};
}
