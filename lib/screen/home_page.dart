import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/screen/add_todo.dart';
import 'package:todo_app/screen/detail_page.dart';

class MyHomePage extends StatefulWidget {
  static const String routeName = "/myhomepage";
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> todos = dataTodo;
  @override
  Widget build(BuildContext context) {
    // Function search
    void searchTodo(String query) {
      final todoFilter = dataTodo.where((todo) {
        final todoTitle = todo.title.toLowerCase();
        final input = query.toLowerCase();
        return todoTitle.contains(input);
      }).toList();
      setState(() {
        todos = todoFilter;
      });
    }

    AppBar myAppbar = AppBar(
      title: const Text("Todo App"),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );

    double heightBody = MediaQuery.of(context).size.height -
        myAppbar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    double widthBody = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddTodo.routeName);
        },
        child: Icon(Icons.add),
      ),
      appBar: myAppbar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: widthBody,
              height: heightBody * 0.15,
              child: TextField(
                onChanged: searchTodo,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search your task..",
                ),
              ),
            ),
            (todos.isNotEmpty)
                ? SizedBox(
                    height: heightBody * 0.85,
                    width: widthBody,
                    child: ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: ((context, index) {
                          final todo = todos[index];
                          return CheckboxListTile(
                            secondary: IconButton(
                              onPressed: () {
                                setState(() {
                                  dataTodo.removeAt(index);
                                });
                              },
                              icon: const Icon(Icons.delete),
                              color: Colors.red,
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            value: todo.isCompleted,
                            onChanged: (value) {
                              setState(() {
                                todo.isCompleted = value!;
                              });
                              // Navigator.pushNamed(
                              //     context, DetailPage.routeName);
                            },
                            title: Text(
                              todo.title,
                              style: TextStyle(
                                  fontSize: 18,
                                  decoration: todo.isCompleted
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                            ),
                            subtitle: Text(todo.desc),
                          );
                        })),
                  )
                : const Center(
                    child: Text("Tidak Ada Data"),
                  )
          ],
        ),
      ),
    );
  }
}
