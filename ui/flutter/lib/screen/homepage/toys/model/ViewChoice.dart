
import 'package:flutter/material.dart';

class ViewChoice {

  static const ViewChoice GRID_VIEW =  ViewChoice(title: 'Grid view', icon: Icons.apps);
  static const ViewChoice LIST_VIEW =  ViewChoice(title: 'List view', icon: Icons.list);
  static const ViewChoice MAP_VIEW =  ViewChoice(title: 'Map view', icon: Icons.map);

  static allViewChoices() {
    return <ViewChoice>[
      GRID_VIEW,
      LIST_VIEW,
      MAP_VIEW
    ];
  }

  final String title;
  final IconData icon;

  const ViewChoice({this.title, this.icon});
}