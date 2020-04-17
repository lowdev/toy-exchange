import 'package:flutter/material.dart';
import 'package:toyexchange/screen/discover/model/PageChoice.dart';
import 'package:toyexchange/screen/discover/toycreation/ToyCreationPage.dart';
import 'package:toyexchange/screen/utils/Screens.dart';
import 'package:toyexchange/screen/discover/model/Toys.dart';
import 'package:toyexchange/screen/discover/toy/GridToyWidget.dart';
import 'package:toyexchange/screen/discover/toy/ListToyWidget.dart';
import 'package:toyexchange/screen/discover/toy/model/Toy.dart';

import 'model/LayoutChoice.dart';

class DiscoverPage extends StatefulWidget {
  @override
  DiscoverPageState createState() => DiscoverPageState();
}

class DiscoverPageState extends State<DiscoverPage> {
  LayoutChoice selectedLayoutChoice = LayoutChoice.LIST_VIEW;
  PageChoice selectedPageChoice;

  void selectLayout(LayoutChoice choice) {
    setState(() {
      selectedLayoutChoice = choice;
    });
  }

  void selectPage(int pageChoice) {
    setState(() {
      selectedPageChoice = PageChoice.allPageChoices()[pageChoice];
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
      PopupMenuButton<LayoutChoice>(
        icon: Icon(Icons.tune),
        onSelected: selectLayout,
        itemBuilder: (BuildContext context) {
          return LayoutChoice.allLayoutChoices().map<PopupMenuEntry<LayoutChoice>>((LayoutChoice choice) {
            return PopupMenuItem<LayoutChoice>(
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
    if (this.selectedPageChoice == PageChoice.DISCOVER_PAGE) {
      return getToysBody(context);
    }

    if (this.selectedPageChoice == PageChoice.CREATION_PAGE) {
      return getToyCreationBody(context);
    }

    return getToysBody(context);
  }

  Widget getToysBody(BuildContext context) {
    if (Screens.isLargeScreen(context)) {
      return GridToyWidget(toys: this.toys);
    }

    if (this.selectedLayoutChoice == LayoutChoice.LIST_VIEW) {
      return ListToyWidget(toys: this.toys);
    }

    return GridToyWidget(toys: this.toys);
  }

  Widget getToyCreationBody(BuildContext context) {
    return ToyCreationPage();
  }

  Widget createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: selectPage,
      items: PageChoice.allPageChoices().map<BottomNavigationBarItem>(
        (PageChoice pageChoice) {
          return BottomNavigationBarItem(
            title: Text(pageChoice.title),
            icon: Icon(pageChoice.icon),
          );
        }).toList()
    );
  }
}