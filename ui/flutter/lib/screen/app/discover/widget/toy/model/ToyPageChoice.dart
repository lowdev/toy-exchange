import 'package:flutter/material.dart';
class ToyPageChoice {

  static const ToyPageChoice DETAIL_PAGE =  ToyPageChoice(title: 'Detail', icon: Icons.description);
  static const ToyPageChoice ASK_FOR_EXCHANGE_PAGE =  ToyPageChoice(title: 'Ask for Exchange', icon: Icons.add_box);

  static allToyPageChoices() {
    return <ToyPageChoice>[
      DETAIL_PAGE,
      ASK_FOR_EXCHANGE_PAGE
    ];
  }

  final String title;
  final IconData icon;

  const ToyPageChoice({this.title, this.icon});
}