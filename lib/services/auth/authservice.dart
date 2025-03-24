import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //grt current user
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  //signin
  Future<UserCredential> signInWithEmailPassword(String email, password) async {
    try {
      //sign user in
      UserCredential userCredentail = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredentail;
    }
    // catch any error
    on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  //sign up
  Future<UserCredential> signUpWithEmailPassword(String email, password) async {
    try {
      //sign user in
      UserCredential userCredentail = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredentail;
    }
    // catch any error
    on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  //signout

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
