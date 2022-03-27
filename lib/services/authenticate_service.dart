import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:personel_app/model/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
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
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final userCredential = GoogleAuthProvider?.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await _firebaseFirestore
            .collection('users')
            .doc(googleUser?.email)
            .set({'email': googleUser?.email, 'uid': googleUser?.id});
        return await FirebaseAuth.instance.signInWithCredential(userCredential);
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      throw FirebaseAuthException(code: 'auth');
    }
  }

  Future<void> signOut() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
    } catch (e) {
      debugPrint('eror: $e');
      error = e.toString();
    }
  }
}
