import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';

class FirebaseSigninWithGoogleUser {
  final _firebase = FirebaseAuth.instance;

  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;

  Future gooleSignOUt() async {
    await googleSignIn.signOut();
  }

  googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        return;
      }
      _user = googleUser;

      final googleAuth = await _user!.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      await _firebase.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Firebase Error", e.message.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } catch (e) {
      log(e.toString());
    }
  }
}
