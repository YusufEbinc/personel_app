import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String error = '';
  bool isActive = false;

  User? _userFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return user;
  }

  Stream<User?> get user {
    return _auth.authStateChanges().map(_userFirebase);
  }

  Future<User?> signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      debugPrint(' genel: ${userCredential.user.hashCode.toString()}');
      return _userFirebase(userCredential.user);
    } on FirebaseAuthException catch (e) {
      debugPrint(' normal: ${e.hashCode.toString()}');
      if (e.code == 'user-not-found') {
        debugPrint(e.message);
        debugPrint(e.hashCode.toString());
        error = 'No user found for that email.';
        debugPrint(' email: ${e.hashCode.toString()}');
      } else if (e.code == 'wrong-password') {
        debugPrint(' password: ${e.hashCode.toString()}');
        error = 'Wrong password provided for that user.';
        debugPrint('Wrong password provided for that user.');
      }
    }
  }

  Future<User?> createUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      isActive = true;
      return _userFirebase(userCredential.user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        error = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        error = 'The account already exists for that email.';
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool?> signOut() async {
    try {
      await _auth.signOut();
      isActive = false;
    } catch (e) {
      debugPrint('eror: $e');
      error = e.toString();
    }
  }
}



/* 
  Future<User?> createUser(String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      return _userFirebase(credential.user);
    } catch (e) {
      debugPrint('error: $e');
      error = e.toString();
    }
  } */
/*  Future<User?> signInUser(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(credential.user.hashCode);
     

      return _userFirebase(credential.user);
    } catch (e) {
      debugPrint('error: $e');
      error = e.toString();
    }
  } */