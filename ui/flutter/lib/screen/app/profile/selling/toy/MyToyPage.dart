import 'package:flutter/material.dart';
import 'package:toyexchange/screen/app/model/Toy.dart';
import 'package:toyexchange/screen/app/model/adapter/ToyRepositoryFactory.dart';
import 'package:toyexchange/screen/app/model/port/ToyRepository.dart';
import 'package:toyexchange/screen/app/toywidget/toydetail/ToyDetailPage.dart';
import './model/ActionChoice.dart';

class MyToyPage extends StatefulWidget {

  final ToyRepository toyRepository = ToyRepositoryFactory.getToyRepository();
  final Toy _toy;

  MyToyPage(this._toy) {}

  @override
  MyToyPageState createState() => MyToyPageState();
}

class MyToyPageState extends State<MyToyPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: createBar(),
      body: ToyDetailPage(widget._toy),
    );
  }

  AppBar createBar() {
    return new AppBar(
      title: new Text(
        widget._toy.name,
        style: new TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87),
      ),
      actions: getActions()
    );
  }

  List<Widget> getActions() {
    return [
      PopupMenuButton<ActionChoice>(
          onSelected: executeAction,
          itemBuilder: (BuildContext context) {
            return ActionChoice.allActionsChoices().map<PopupMenuEntry<ActionChoice>>((ActionChoice choice) {
              return PopupMenuItem<ActionChoice>(
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

  void executeAction(ActionChoice choice) {
    if (ActionChoice.DELETE == choice) {

      showDialog<ConfirmAction>(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("Do you really want to delete ?"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(ConfirmAction.NO),
                  child: Text("No"),
                ),
                FlatButton(
                  onPressed: () {
                    widget.toyRepository.delete(widget._toy.id);
                    Navigator.of(context).pop(ConfirmAction.YES);
                  },
                  child: Text("Yes"),
                ),
              ],
            );
          }
      ).then((val) {
        if (ConfirmAction.YES == val) {
          Navigator.pop(context);
        }
      });
    }
  }
}

enum ConfirmAction { YES, NO }
