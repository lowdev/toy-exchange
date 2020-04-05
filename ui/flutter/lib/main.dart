import 'package:flutter/material.dart';
import 'package:toyexchange/common/theme.dart';
import 'package:toyexchange/screen/homepage/toys/ToysPage.dart';
import 'package:toyexchange/screen/login/LoginWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return  MaterialApp(
        title: 'Provider Demo',
        theme: appTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => LoginWidget(),
          '/toys': (context) => ToysPage()
        },
      );
  }
}