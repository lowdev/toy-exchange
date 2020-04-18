import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white30,
        appBar: createBar(),
        body: createBody(context)
    );
  }

  AppBar createBar() {
    return new AppBar(
      title: new Text(
        "Profile",
        style: new TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87),
      ),
    );
  }

  Widget createBody(BuildContext context) {
    return new Text("test");
  }
}