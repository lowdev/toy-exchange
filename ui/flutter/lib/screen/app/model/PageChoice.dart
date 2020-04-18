import 'package:flutter/material.dart';
import 'package:toyexchange/screen/app/discover/DiscoverPage.dart';
import 'package:toyexchange/screen/app/toycreation/ToyCreationPage.dart';

class PageChoice {

  static PageChoice DISCOVER_PAGE =  PageChoice(title: 'Discover', icon: Icons.search, page: DiscoverPage());
  static PageChoice CREATION_PAGE =  PageChoice(title: 'Add', icon: Icons.add_box, page: ToyCreationPage());
  static PageChoice PROFILE_PAGE =  PageChoice(title: 'My profile', icon: Icons.account_box, page: DiscoverPage());

  static allPageChoices() {
    return <PageChoice>[
      DISCOVER_PAGE,
      CREATION_PAGE,
      PROFILE_PAGE
    ];
  }

  static List<Widget> allPage() {
    return allPageChoices().map<Widget>(
        (PageChoice pageChoice) {
          return pageChoice.page;
        }
    ).toList();
  }

  final String title;
  final IconData icon;
  final Widget page;

  PageChoice({this.title, this.icon, this.page});
}