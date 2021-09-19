import 'package:flutter/material.dart';
import 'package:todolist/models/TempTaskClass.dart';
import 'package:todolist/models/task_data.dart';
import 'dbhelper.dart';
import 'screens/task_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

DbHelper dbHelper = DbHelper();

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
