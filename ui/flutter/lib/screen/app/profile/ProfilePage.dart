import 'package:flutter/material.dart';
import 'package:toyexchange/common/my_custom_icons_icons.dart';
import 'package:toyexchange/screen/app/profile/selling/SellingPage.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(MyCustomIcons.puzzle)),
              Tab(icon: Icon(Icons.favorite)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
          title: Center(child: Text('Mon Profil')),
        ),
        body: TabBarView(
          children: [
            new SellingPage(),
            Icon(Icons.favorite),
            Icon(Icons.person),
          ],
        ),
      ),
    );
  }

  AppBar createBar() {
    return new AppBar(
      title: Center(
        child: new Text(
          "Profile",
          style: new TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
      )
    );
  }
}