import 'package:flutter/material.dart';

class PageChoice {

  static const PageChoice DISCOVER_PAGE =  PageChoice(title: 'Discover', icon: Icons.search);
  static const PageChoice CREATION_PAGE =  PageChoice(title: 'Add', icon: Icons.add_box);
  static const PageChoice PROFILE_PAGE =  PageChoice(title: 'My profile', icon: Icons.account_box);

  static allPageChoices() {
    return <PageChoice>[
      DISCOVER_PAGE,
      CREATION_PAGE,
      PROFILE_PAGE
    ];
  }

  final String title;
  final IconData icon;

  const PageChoice({this.title, this.icon});
}