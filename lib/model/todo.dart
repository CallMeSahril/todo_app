class Todo {
  final String id;
  final String title;
  final String desc;
  bool isCompleted;

  Todo(
      {required this.id,
      required this.title,
      required this.desc,
      this.isCompleted = false});
}

List<Todo> dataTodo = [
  Todo(
    id: DateTime.now().toString(),
    title: "How To Make Flutter",
    desc: "Make flutter to everyone",
  ),
  Todo(
    id: DateTime.now().toString(),
    title: "How To Make PhotoShoot",
    desc: "Make PhotoShoot to everyone",
  ),
];
