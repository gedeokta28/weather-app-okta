import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app_okta/core/utils/helper.dart';
import 'package:weather_app_okta/features/weather/presentation/pages/weather_list_page.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(msg: 'Registration successful');
      if (globalContext.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          globalContext,
          WeatherListPage.routeName,
          (route) => false,
        );
      }
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(msg: 'The email address is already in use.');
      } else {
        Fluttertoast.showToast(msg: 'An error occurred: ${e.code}');
      }
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      Fluttertoast.showToast(msg: 'Login Succesfully');
      if (globalContext.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          globalContext,
          WeatherListPage.routeName,
          (route) => false,
        );
      }
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.code == 'invalid-credential') {
        Fluttertoast.showToast(msg: 'Invalid email or password.');
      } else {
        Fluttertoast.showToast(msg: 'An error occurred: ${e.code}');
      }
    }
    return null;
  }
}
