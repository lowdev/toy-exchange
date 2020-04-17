
import 'package:flutter/material.dart';

class LayoutChoice {

  static const LayoutChoice GRID_VIEW =  LayoutChoice(title: 'Grid view', icon: Icons.apps);
  static const LayoutChoice LIST_VIEW =  LayoutChoice(title: 'List view', icon: Icons.list);
  static const LayoutChoice MAP_VIEW =  LayoutChoice(title: 'Map view', icon: Icons.map);

  static allLayoutChoices() {
    return <LayoutChoice>[
      GRID_VIEW,
      LIST_VIEW,
      MAP_VIEW
    ];
  }

  final String title;
  final IconData icon;

  const LayoutChoice({this.title, this.icon});
}