import 'package:flutter/material.dart';
import 'package:toyexchange/screen/utils/Screens.dart';
import 'package:toyexchange/screen/homepage/toys/model/Toys.dart';
import 'package:toyexchange/screen/homepage/toys/toy/GridToyWidget.dart';
import 'package:toyexchange/screen/homepage/toys/toy/ListToyWidget.dart';
import 'package:toyexchange/screen/homepage/toys/toy/model/Toy.dart';

import 'model/ViewChoice.dart';

class DiscoverPage extends StatefulWidget {
  @override
  DiscoverPageState createState() => DiscoverPageState();
}

class DiscoverPageState extends State<DiscoverPage> {
  ViewChoice selectedViewChoice = ViewChoice.LIST_VIEW;

  void select(ViewChoice choice) {
    setState(() {
      selectedViewChoice = choice;
    });
  }

  final List<Toy> toys = Toys.allToys();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: getBar(),
        body: new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
            child: getBody(context)),
        bottomNavigationBar: createBottomNavigationBar(),
    );
  }

  AppBar getBar() {
    return new AppBar(
      title: new Text(
        "Discover",
        style: new TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87)
      ),
      actions: getActions()
    );
  }

  List<Widget> getActions() {
    return [
      IconButton(
        icon: Icon(Icons.search),
      ),
      PopupMenuButton<ViewChoice>(
        icon: Icon(Icons.tune),
        onSelected: select,
        itemBuilder: (BuildContext context) {
          return ViewChoice.allViewChoices().map<PopupMenuEntry<ViewChoice>>((ViewChoice choice) {
            return PopupMenuItem<ViewChoice>(
              value: choice,
              child: ListTile(
                leading: Icon(choice.icon),
                title: Text(choice.title)
              )
            );
          }).toList();
        }
      )
    ];
  }

  Widget getBody(BuildContext context) {
    if (Screens.isLargeScreen(context)) {
      return GridToyWidget(toys: this.toys);
    }

    if (this.selectedViewChoice == ViewChoice.LIST_VIEW) {
      return ListToyWidget(toys: this.toys);
    }

    return GridToyWidget(toys: this.toys);
  }

  Widget createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          title: Text("Discover"),
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          title: Text("Add"),
          icon: Icon(Icons.add_box),
        ),
        BottomNavigationBarItem(
          title: Text("My profile"),
          icon: Icon(Icons.account_box),
        ),
      ],
      onTap: (int index){
      },
    );
  }
}