import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.favorite)),
              Tab(icon: Icon(Icons.person)),
            ],
          ),
          title: Center(child: Text('Mon Profil')),
        ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
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

  Widget createBody(BuildContext context) {
    return new Text("Profile");
  }
}