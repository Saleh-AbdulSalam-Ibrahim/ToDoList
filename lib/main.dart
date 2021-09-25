import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/models/task_data.dart';

import 'dbhelper.dart';
import 'models/helpers.dart';
import 'screens/task_screen.dart';

void main() {
  runApp(MyApp());
}

DbHelper dbHelper = DbHelper();
TodoProvider todoProvider = TodoProvider();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskData(),
      child: MaterialApp(
        // theme: ThemeData.dark().copyWith(
        //     //unselectedWidgetColor: Colors.white,
        //     ),
        debugShowCheckedModeBanner: false,
        home: TasksScreen(),
      ),
    );
  }
}
