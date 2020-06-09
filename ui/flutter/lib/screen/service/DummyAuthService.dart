import 'package:toyexchange/screen/app/model/User.dart';

import 'AuthService.dart';

class DummyAuthService implements AuthService {
  @override
  Future<User> getCurrentUser() {
    return Future.value(new User("dummyToken"));
  }

  @override
  String getToken() {
    return "dummyToken";
  }

  @override
  Future<bool> isEmailVerified() {
    return Future.value(true);
  }

  @override
  Future<void> sendEmailVerification() {
    return Future.value();
  }

  @override
  Future<String> signIn(String email, String password) {
    return Future.value("dummyName");
  }

  @override
  Future<void> signOut() {
    return Future.value();
  }

  @override
  Future<String> signUp(String email, String password) {
    return Future.value("dummyName");
  }
}