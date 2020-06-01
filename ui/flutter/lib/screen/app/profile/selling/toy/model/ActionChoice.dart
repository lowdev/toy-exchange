import 'package:flutter/material.dart';

class ActionChoice {

  static const ActionChoice DELETE =  ActionChoice(title: 'Delete', icon: Icons.delete);

  static allActionsChoices() {
    return <ActionChoice>[
      DELETE
    ];
  }

  final String title;
  final IconData icon;

  const ActionChoice({this.title, this.icon});
}