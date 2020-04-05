import 'package:flutter/material.dart';
import 'package:toyexchange/screen/homepage/toys/model/Toys.dart';
import 'package:toyexchange/screen/homepage/toys/toy/ToyWidget.dart';
import 'package:toyexchange/screen/homepage/toys/toy/model/Toy.dart';

class ToysWidget extends StatelessWidget {

  final List<Toy> toys = Toys.allToys();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: getBar(),
        body: new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: getBody(context))
    );
  }

  AppBar getBar() {
    return new AppBar(
      title: new Text(
        "Toys",
        style: new TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87),
      ),
    );
  }

  Widget getBody(BuildContext context) {
    return ListView.builder(
      itemCount: toys.length,
      itemBuilder: (context, index) => new ToyWidget(toy: toys[index]),
      padding: EdgeInsets.all(0.0),
    );
  }
}