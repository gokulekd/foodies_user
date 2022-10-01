import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodies_user/view/pages/razorpay/after_payment_sucsess.dart';
import 'package:get/get.dart';

class OrderTrackingController extends GetxController {
  orderUnderConfirmation({required grandTotal,required paymentTransactionID, required orderID}) async {
    final cart = await FirebaseFirestore.instance
        .collection("User cart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("cart Item")
        .get()
        .then((value) => value.docs.map((e) => e.data()).toList());
    await FirebaseFirestore.instance
        .collection("order Tracking")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("data")
        .add({
          "firebase Document ID": orderID,
          "order Details": cart,
          "order confirmed": true,
          "order preparing ": true,
          "order delivered": true,
          "order rejected": false,
          "grand Amount": grandTotal/100,
          "Payment Transaction ID":paymentTransactionID,
          "order ID" :orderID,
          "time Of order": DateTime.now(),
          "customer Data":{
            "user name": FirebaseAuth.instance.currentUser!.email,
            "user Uid":FirebaseAuth.instance.currentUser!.uid,
            "name":FirebaseAuth.instance.currentUser!.displayName,
            "phone Number":FirebaseAuth.instance.currentUser!.phoneNumber,
            "image":FirebaseAuth.instance.currentUser!.photoURL,
            
          }


        })
        .then((value) => value.update({
              "firebase Document ID": value.id,
            }))
        .then((value) async {
          final value = await FirebaseFirestore.instance
              .collection("User cart")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("cart Item")
              .get()
              .then((value) => value.docs.map((e) => e.id).toList());
          log("all data>>>>>>>from cart${value.toString()}");
          for (var i = 0; i < value.length; i++) {
            await FirebaseFirestore.instance
                .collection("User cart")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection("cart Item")
                .doc(value[i])
                .delete();
          }
          log("all data>>>>deleted from cart");
        })
        .then((value) {
          Get.to(() => PaymentSucsessPage(
                amountPaid: grandTotal/100,orderID: orderID,PaymentTransactionID: paymentTransactionID,
              ));
        });
  }
}
