import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodies_user/model/add_to_cart.dart';
import 'package:foodies_user/model/order_tracking_model.dart';
import 'package:foodies_user/model/user_model.dart';

import 'package:foodies_user/view/pages/razorpay/after_payment_sucsess.dart';
import 'package:get/get.dart';

class OrderTrackingController extends GetxController {
  orderUnderConfirmation(
      {required grandTotal,
      required paymentTransactionID,
      required orderID}) async {
    final user = FirebaseAuth.instance.currentUser!;

    final userdata = UserModel(
        email: user.email!,
        image: user.photoURL!,
        name: user.displayName!,
        phoneNumber: int.parse(user.phoneNumber!),
        uid: user.uid);

    final cart = await FirebaseFirestore.instance
        .collection("User cart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("cart Item")
        .get()
        .then((value) =>
            value.docs.map((e) => AddtoCart.fromMap(e.data())).toList());

    final OderTrackingDetails oderTrackingDetailsData = OderTrackingDetails(
        firebaseDocumentId: "",
        orderConfirmed: true,
        orderPreparing: true,
        orderDelivered: true,
        orderRejected: false,
        grandTotalAmount: grandTotal,
        paymentTransactionId: paymentTransactionID,
        orderId: orderID,
        timeOfOrder: DateTime.now(),
        user: userdata,
        cartData: cart);

    await FirebaseFirestore.instance
        .collection("order Tracking")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("data")
        .add(oderTrackingDetailsData.toMap())
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
    }).then((value) {
      Get.to(() => PaymentSucsessPage(
            amountPaid: grandTotal / 100,
            orderID: orderID,
            PaymentTransactionID: paymentTransactionID,
          ));
    });
  }
}
