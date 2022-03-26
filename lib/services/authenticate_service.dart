import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personel_app/model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String error = '';

  UserModel? _userFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return UserModel(user.email, user.uid);
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userFirebase);
  }

  Future<UserModel?> signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userFirebase(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        error = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        error = 'Wrong password provided for that user.';
      }
    }
  }

  Future<UserModel?> createUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      return _userFirebase(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        error = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        error = 'The account already exists for that email.';
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool?> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      debugPrint('eror: $e');
      error = e.toString();
    }
  }
}
