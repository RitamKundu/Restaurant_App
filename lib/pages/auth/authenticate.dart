import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // SignIn with email & password
  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed in';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'Please enter correct email');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: 'Please enter correct password');
      }
    }
  }

  // Signing out the user
  Future<String?> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return 'Signed out';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // Getting current user
  User? getUser() {
    try {
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException {
      return null;
    }
  }
}
