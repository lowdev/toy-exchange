import 'package:firebase_auth/firebase_auth.dart';
import 'package:toyexchange/screen/app/model/User.dart';
import 'package:toyexchange/screen/service/AuthService.dart';

class FirebaseAuthService implements AuthService {
  
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String _token = "";

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;

    _token = await _getToken(user);
    
    return user.uid;
  }
  
  Future<String> _getToken(FirebaseUser user) async {
    IdTokenResult idTokenResult = await user.getIdToken();
    return idTokenResult.token;
  }

  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  Future<User> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return null;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

  String getToken() {
    return this._token;
  }
}