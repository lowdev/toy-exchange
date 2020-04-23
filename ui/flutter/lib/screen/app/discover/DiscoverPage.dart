import 'package:flutter/material.dart';
import 'package:toyexchange/screen/app/discover/widget/toy/ToyPage.dart';
import 'package:toyexchange/screen/utils/Screens.dart';
import '../toywidget/GridToyWidget.dart';
import 'widget/ListToyWidget.dart';
import 'model/Toys.dart';
import '../model/Toy.dart';
import 'model/LayoutChoice.dart';

class DiscoverPage extends StatefulWidget {
  @override
  DiscoverPageState createState() => DiscoverPageState();
}

class DiscoverPageState extends State<DiscoverPage> {
  LayoutChoice selectedLayoutChoice = LayoutChoice.LIST_VIEW;

  void selectLayout(LayoutChoice choice) {
    setState(() {
      selectedLayoutChoice = choice;
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
        onPressed: () => {},
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
    if (Screens.isLargeScreen(context)) {
      return GridToyWidget(toys: this.toys);
    }

    if (this.selectedLayoutChoice == LayoutChoice.LIST_VIEW) {
      return ListToyWidget(toys: this.toys);
    }

    return GridToyWidget(toys: this.toys, onClickCallback: (Toy toy) => new ToyPage(toy));
  }
}