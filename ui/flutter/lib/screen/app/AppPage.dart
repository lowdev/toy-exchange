import 'package:flutter/material.dart';
import 'model/PageChoice.dart';

class AppPage extends StatefulWidget {
  @override
  AppPageState createState() => AppPageState();
}

class AppPageState extends State<AppPage> {
  int selectedPageChoice = 0;

  void selectPage(int pageChoice) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PageChoice.allPage()[pageChoice]));
    /*setState(() {
      selectedPageChoice = pageChoice;
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: getBody(),
        bottomNavigationBar: createBottomNavigationBar(),
    );
  }

  Widget getBody() {
    return IndexedStack(
        index: selectedPageChoice,
        children: PageChoice.allPage(),
    );
  }

  Widget createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedPageChoice,
      onTap: selectPage,
      items: PageChoice.allPageChoices().map<BottomNavigationBarItem>(
        (PageChoice pageChoice) {
          return BottomNavigationBarItem(
            title: Text(pageChoice.title),
            icon: Icon(pageChoice.icon),
          );
        }).toList()
    );
  }
}