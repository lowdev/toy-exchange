import 'package:toyexchange/common/environment.dart';
import 'package:toyexchange/screen/service/AuthService.dart';
import 'package:toyexchange/screen/service/DummyAuthService.dart';

import 'FirebaseAuthService.dart';

class AuthServiceFactory {

  static final AuthService _fireBaseAuthService = new FirebaseAuthService();
  static final AuthService _dummyAuthService = new DummyAuthService();

  static AuthService getAuthService() {
    if (Environment.isProd) {
      return _fireBaseAuthService;
    }

    return _dummyAuthService;
  }
}