// ignore_for_file: prefer_final_fields, unused_field, avoid_print, unnecessary_null_comparison, unused_element, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:quizmaker/models/users.dart';

class AuthService {
  FirebaseAuth _authr = FirebaseAuth.instance;

  app_User? _userFromFirebaseUser(User u) {
    return u != null ? app_User(uid: u.uid) : null;
  }

  Future signInEmailAndPass(String email, String password) async {
    try {
      UserCredential usrCred = await _authr.signInWithEmailAndPassword(
          email: email, password: password);
      User? fuser = usrCred.user;
      return _userFromFirebaseUser(fuser!);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signUpWithEmailAndPass(String email, String password) async {
    try {
      UserCredential userCred = await _authr.createUserWithEmailAndPassword(
          email: email, password: password);

      User? fuser = userCred.user;
      return _userFromFirebaseUser(fuser!);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await _authr.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
