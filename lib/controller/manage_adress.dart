import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/model/adressmodel.dart';
import 'package:foodies_user/view/pages/cart%20module/screen_cart.dart';
import 'package:get/get.dart';

class ManageAdress extends GetxController {
  final firebase = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  addAdress(AdressModel adress) async {
    try {
      await firebase
          .collection("Adress")
          .doc(user!.uid).collection("all Adress")
          .add(adress.toJson())
          .then((value) {
        Get.snackbar("sucsess", "Adress Added",
            backgroundColor: kgreen, colorText: kwhite);
        Get.off(() => const ScreenCart());
      });
    } on FirebaseException catch (e) {
      Get.snackbar("error", e.message.toString(),
          backgroundColor: kgreen, colorText: kwhite);
    } catch (e) {
      log(e.toString());
    }
  }
}
