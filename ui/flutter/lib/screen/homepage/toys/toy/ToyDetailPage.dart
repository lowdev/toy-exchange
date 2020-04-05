import 'package:flutter/material.dart';
import 'model/Toy.dart';

class ToyDetailWidget extends StatefulWidget {

  final Toy toy;

  ToyDetailWidget(this.toy) { }

  @override
  ToyDetailWidgetState createState() => ToyDetailWidgetState();
}

class ToyDetailWidgetState extends State<ToyDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return getScaffold();
  }

  Widget getScaffold() {
    return new Scaffold(
      backgroundColor: Colors.blue,
      appBar: createBar(),
      body: new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
        child: createBody(context)),
      bottomNavigationBar: createBottomNavigationBar(),
    );
  }

  AppBar createBar() {
    return new AppBar(
      title: new Text(
        widget.toy.name,
        style: new TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87),
      ),
    );
  }

  Widget createBody(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.toy.name, style: TextStyle(fontSize: 36.0, color: Colors.black))
        ],
      )
    );
  }

  Widget createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      fixedColor: Colors.teal,
      items: [
        BottomNavigationBarItem(
          title: Text("Detail"),
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          title: Text("Ask for Exchange"),
          icon: Icon(Icons.add_box),
        ),
      ],
      onTap: (int index){
      },
    );
  }
}