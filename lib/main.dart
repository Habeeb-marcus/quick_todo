import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_sample/provider/todo_provider.dart';
import 'package:todo_sample/screens/task_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: ((context) => TodosProvider()),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: TaskScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

