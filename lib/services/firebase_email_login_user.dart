import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/view/widget/BottomNavigationBar.dart';
import 'package:get/get.dart';

class FirebaseEmailLoginUser {
  final _firebaseAuth = FirebaseAuth.instance;
  userLogin(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Get.to(() => const CustomBottomNavigationBar());
        Get.snackbar("Message", "user login Sucsses",
            backgroundColor: Colors.green, colorText: Colors.white);
        return value;
      });

      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Firebase Error", e.message.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
