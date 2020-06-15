import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:toyexchange/common/theme.dart';
import 'package:toyexchange/screen/app/AppPage.dart';
import 'package:toyexchange/screen/login/LoginWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _initFirebase();

    // Using MultiProvider is convenient when providing multiple objects.
    return  MaterialApp(
        title: 'Puzzle exchange',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginPage(),
          '/discover': (context) => AppPage()
        },
      );
  }

  _initFirebase() {
    try {
      initializeApp(
          apiKey: "AIzaSyBKfqgXgJwJ52O-IMgjJyb1uXwvMR_PBxo",
          authDomain: "toy-exchange.firebaseapp.com",
          //databaseURL: "https://toy-exchange.firebaseio.com",
          projectId: "toy-exchange",
          //storageBucket: "toy-exchange.appspot.com",
          //messagingSenderId: "764254890761",
          appId: "1:764254890761:web:ebb8fedfa33564fac2c1d8");
    } catch (err) {
      // Already init
    }
  }
}