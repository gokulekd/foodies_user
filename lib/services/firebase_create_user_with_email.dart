import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/view/widget/BottomNavigationBar.dart';
import 'package:get/get.dart';

class FirebaseCreateUserWithEmail {
  final _firebase = FirebaseAuth.instance;

  createNewUser({
    required String name,
    required String mobile,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebase
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        User? user = FirebaseAuth.instance.currentUser;
        final firestore = FirebaseFirestore.instance;
        await firestore.collection("user Credentials").doc(user!.uid).set({
          'uid': user.uid,
          'email': email,
          'password': password,
          "mobile": mobile,
          'role': "user"
        }).then((value) async {
          Get.to(() => const CustomBottomNavigationBar());
        });
      });
      Get.snackbar("Message", "Created User Sucssesfully",
          backgroundColor: Colors.green, colorText: Colors.white);

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Firebase Error", e.message.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } on FirebaseFirestore catch (e) {
      Get.snackbar("Firebase Error", e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    } catch (e) {
      log(e.toString());
    } finally {}
    return null;
  }
}
