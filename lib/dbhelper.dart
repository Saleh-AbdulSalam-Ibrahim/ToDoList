import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/task.dart';

String pathLocated = '';

class DbHelper {
  static final DbHelper _instance = DbHelper.internal();

  factory DbHelper() => _instance;

  DbHelper.internal();

  static late Database _database;

  Future<Database> createDatabase() async {
    if (_database != null) {
      return _database;
    }
    String path = join(await getDatabasesPath(), 'todolist.db');
    pathLocated = path;
    _database = await openDatabase(path, version: 1,
        onCreate: (Database db, int v) async {
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT)');
    });
    return _database;
  }

  Future<int> insertTask(Task task) async {
    Database db = await createDatabase();
    //insert bay Sql Statements db.rawInsert('             ')
    //db.insert('TableName', {'ColN' : ValCell } )
    return db.insert('tasks', task.toMap());
  }

  Future<List<Task>> allTasks() async {
    Database db = await createDatabase();
    List<Task> t = await db.query('tasks') as List<Task>;
    //print('alltasks Function $t');
    return t;
  }

  Future<int> deleteTask(String txt) async {
    Database db = await createDatabase();
    print('$txt Deleted');
    return db.delete('tasks', where: 'title = ?', whereArgs: [txt]);
  }
}
