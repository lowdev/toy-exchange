import 'package:flutter/material.dart';

class Screens {

  static bool isSmartphoneScreen(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    if (screenSize > 0 && screenSize <= 500) {
      return true;
    }

    return false;
  }

  static bool isTabletScreen(BuildContext context) {
    var screenSize = MediaQuery.of(context).size.width;
    if (screenSize > 500 && screenSize <= 800) {
      return true;
    }

    return false;
  }

  static bool isDesktopScreen(BuildContext context) {
    if (MediaQuery.of(context).size.width > 800) {
      return true;
    }

    return false;
  }
}