import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = "/detail_page";
  const DetailPage({Key? key, this.title, this.subtitle}) : super(key: key);
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
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
      appBar: myAppbar,
      body: Text(title!),
    );
  }
}
