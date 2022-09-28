import 'package:flutter/material.dart';
import 'package:todo_app/screen/add_todo.dart';
import 'package:todo_app/screen/detail_page.dart';
import 'package:todo_app/screen/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: "Montserrat",
      ),
      routes: {
        MyHomePage.routeName: ((context) => const MyHomePage()),
        AddTodo.routeName: (context) => const AddTodo(),
        DetailPage.routeName: (context) => const DetailPage()
      },
      initialRoute: MyHomePage.routeName,
    );
  }
}
