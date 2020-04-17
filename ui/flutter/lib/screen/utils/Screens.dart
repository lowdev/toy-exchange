import 'package:flutter/material.dart';

class Screens {
  static bool isLargeScreen(BuildContext context) {
    if (MediaQuery.of(context).size.width > 600) {
      return true;
    }

    return false;
  }
}