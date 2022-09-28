import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class AddTodo extends StatelessWidget {
  static const String routeName = "/add_todo";
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerTitle = TextEditingController();
    TextEditingController controllerDesc = TextEditingController();
    AppBar myAppbar = AppBar(
      title: const Text("Add Todo"),
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
          if (controllerTitle.text.isNotEmpty ||
              controllerDesc.text.isNotEmpty) {
            dataTodo.add(Todo(
              id: DateTime.now().toString(),
              title: controllerTitle.text.isEmpty
                  ? "No Title"
                  : controllerTitle.text,
              desc: controllerDesc.text.isEmpty
                  ? "No Description"
                  : controllerDesc.text,
            ));
          }
          Navigator.pop(context);
        },
        child: Icon(Icons.add_task),
      ),
      appBar: myAppbar,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          width: widthBody,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white12),
                child: TextField(
                  controller: controllerTitle,
                  maxLength: 20,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    hintText: "Title",
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: heightBody * 0.05,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white12),
                child: TextField(
                  controller: controllerDesc,
                  maxLines: 10,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    hintText: "Description",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
