import 'package:flutter/material.dart';
import 'package:toyexchange/screen/app/model/Toy.dart';
import 'package:toyexchange/screen/app/toywidget/toydetail/ToyDetailPage.dart';
import 'model/ToyPageChoice.dart';

class ToyPage extends StatefulWidget {

  final List<ToyPageChoice> toyPageChoices = ToyPageChoice.allToyPageChoices();

  final Toy _toy;

  ToyPage(this._toy);

  @override
  ToyPageState createState() => ToyPageState();
}

class ToyPageState extends State<ToyPage> {
  int selectedPageChoice = 0;

  void selectPage(int pageChoice) {
    setState(() {
      selectedPageChoice = pageChoice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white30,
      body: ToyDetailPage(widget._toy, new List<Widget>()),
      bottomNavigationBar: createBottomNavigationBar(),
    );
  }

  Widget createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedPageChoice,
      onTap: selectPage,
      items: widget.toyPageChoices.map<BottomNavigationBarItem>(
          (ToyPageChoice pageChoice) {
        return BottomNavigationBarItem(
          title: Text(pageChoice.title),
          icon: Icon(pageChoice.icon),
        );
      }).toList()
    );
  }

  ToyPageChoice getCurrentToyPageChoice() {
    return widget.toyPageChoices[selectedPageChoice];
  }
}