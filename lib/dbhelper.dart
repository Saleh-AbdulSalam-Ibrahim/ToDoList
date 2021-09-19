import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'models/TempTaskClass.dart';
import 'models/task.dart';

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

    _database =
        await openDatabase(path, version: 1, onCreate: (Database db, int v) {
      db.execute(
          'create table tasks(id integer primary key autoincrement, title varchar(255), isDone integer)');
    });
    return _database;
  }

  Future<int> insertTask(TempTaskClass task) async {
    Database db = await createDatabase();
    //insert bay Sql Statements db.rawInsert('             ')
    //db.insert('TableName', {'ColN' : ValCell } )
    return db.insert('tasks', task.toMap());
  }

  Future<List> allTasks() async {
    Database db = await createDatabase();
    //db.rawQuery('sql statements');
    return db.query('tasks');
  }

  Future<int> deleteTask(int id) async {
    Database db = await createDatabase();
    return db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
