import 'package:flutter/material.dart';
import 'package:toyexchange/common/theme.dart';
import 'package:toyexchange/screen/homepage/toys/DiscoverPage.dart';
import 'package:toyexchange/screen/login/LoginWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return  MaterialApp(
        title: 'Puzzle exchange',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginWidget(),
          '/discover': (context) => DiscoverPage()
        },
      );
  }
}