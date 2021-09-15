class Task {
  final String titleOfTask;
  bool isDone;
  int id;
  Task({required this.titleOfTask, this.isDone = false, required this.id});
  void toggleDone() {
    isDone = !isDone;
  }
}
