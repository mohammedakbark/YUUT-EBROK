import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationController {
  final _auth = FirebaseAuth.instance;

  bool checkUserAuthenticationStatus() {
    if (_auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }
}
