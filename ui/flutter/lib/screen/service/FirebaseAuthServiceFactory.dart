import 'package:toyexchange/screen/service/AuthService.dart';

import 'FirebaseAuthService.dart';

class AuthServiceFactory {

  static final AuthService _singleton = new FirebaseAuthService();

  static AuthService getAuthService() {
    return _singleton;
  }
}