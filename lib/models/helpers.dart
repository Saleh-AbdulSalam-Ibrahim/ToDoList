import 'package:sqflite/sqflite.dart';

final String tableTodo = 'todo';
final String columnId = '_id';
final String columnTitle = 'title';
final String columnDone = 'done';

class TaskToDo {
  late int id;
  late String title;
  late bool done = false;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      columnTitle: title,
      columnDone: done == true ? 1 : 0
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  void toggleDone() {
    done = !done;
  }

  get getDone => done;

  TaskToDo({required this.title, required this.id});

  TaskToDo.fromMap(Map<String, Object?> map) {
    id = map[columnId] as int;
    title = map[columnTitle].toString();
    done = map[columnDone] == 1;
  }
}

class TodoProvider {
  late Database db;

  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableTodo ( 
  $columnId integer primary key autoincrement, 
  $columnTitle text not null,
  $columnDone integer not null)
''');
    });
  }

  Future<TaskToDo> insert(TaskToDo todo) async {
    todo.id = await db.insert(tableTodo, todo.toMap());
    return todo;
  }

  Future<TaskToDo?> getTodo(int id) async {
    List<Map> maps = await db.query(tableTodo,
        columns: [columnId, columnDone, columnTitle],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return TaskToDo.fromMap(maps.first as Map<String, Object?>);
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<bool> update(TaskToDo todo) async {
    await db.execute(
        'UPDATE $tableTodo SET done=${todo.getDone}, where $columnId = ${todo.id}');
    // if (await db
    //         .query('select done from $tableTodo where $columnId=${//todo.id}') !=
    //     null)
    //   return true;
    // else
    return true;
  }

  Future<TaskToDo?> getAllTasks() async {
    List<Map> maps = await db.query(
      tableTodo,
      columns: [columnId, columnDone, columnTitle],
    );
    if (maps.length > 0) {
      return TaskToDo.fromMap(maps as Map<String, Object?>);
    }
    return null;
  }

  Future close() async => db.close();
}
