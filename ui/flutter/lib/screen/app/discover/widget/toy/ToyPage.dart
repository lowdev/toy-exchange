import 'package:flutter/material.dart';
import 'package:toyexchange/screen/app/model/Toy.dart';
import 'package:toyexchange/screen/app/toywidget/toydetail/ToyDetailPage.dart';
import 'askforexchange/AskForExchangePage.dart';
import 'model/ToyPageChoice.dart';

class ToyPage extends StatefulWidget {

  final List<ToyPageChoice> toyPageChoices = ToyPageChoice.allToyPageChoices();

  final Toy toy;

  ToyPage(this.toy);

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
      appBar: createBar(),
      body: createBody(context),
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
    if (ToyPageChoice.DETAIL_PAGE == getCurrentToyPageChoice()) {
      return new ToyDetailPage(widget.toy);
    }
    
    return new AskForExchangePage();
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