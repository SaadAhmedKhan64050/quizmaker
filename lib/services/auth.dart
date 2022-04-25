// // ignore_for_file: prefer_final_fields, unused_field, avoid_print, unused_local_variable, unused_import, import_of_legacy_library_into_null_safe, unused_element, unnecessary_null_comparison

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:quizmaker/models/user.dart';
// import 'package:quizmaker/views/signin.dart';

// class AuthService {
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   Users? _userFromFirebaseUser(User users) {
//     return users != null ? Users(uid: users.uid) : null;
//   }

//   Future signInEmailAndPass(String email, String password) async {
//     try {
//       UserCredential authResult = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       User? firebaseUser = authResult.user;
//       return _userFromFirebaseUser(firebaseUser);
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future signUpWithEmailAndPass(String email, String password) async {
//     try {
//       AuthResult authResult = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       FirebaseUser firebaseUser = authResult.user;
//       return _userFromFirebaseUser(firebaseUser);
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   Future signOut() async {
//     try {
//       return await _auth.signOut(); 
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
// }
