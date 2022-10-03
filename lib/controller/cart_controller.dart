import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/model/add_to_cart.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxInt allSubtotal = 0.obs;

  @override
  void onInit() {
    grandTotalAmount();
    super.onInit();
  }

  addProductToCart(AddtoCart product) async {
    final alldata = await FirebaseFirestore.instance
        .collection("User cart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("cart Item")
        .where("id", isEqualTo: product.id)
        .get();
    try {
      log(alldata.docs.toString());
      if (alldata.docs.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection("User cart")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("cart Item")
            .doc(product.id)
            .update({"quantity": FieldValue.increment(1)});
      } else {
        await FirebaseFirestore.instance
            .collection("User cart")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("cart Item")
            .doc(product.id)
            .set(product.toMap());
      }
      Get.snackbar("Message", "Product added to cart",
          backgroundColor: kgreen, colorText: kwhite);
    } on FirebaseException catch (e) {
      Get.snackbar("error", e.message.toString(),
          backgroundColor: kred, colorText: kwhite);
    } catch (e) {
      log(">>>>>Product add to cart Error>>>>${e.toString()}");
    }

    getSubtotal(product);
  }

  removeProductFromCart(AddtoCart product) async {
    try {
      final alldata = await FirebaseFirestore.instance
          .collection("User cart")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("cart Item")
          .where("id", isEqualTo: product.id)
          .get();
      final countCheck = await FirebaseFirestore.instance
          .collection("User cart")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("cart Item")
          .doc(product.id)
          .get()
          .then((value) => value.data()!["quantity"] == 1);
      log(countCheck.toString());

      if (alldata.docs.isNotEmpty && countCheck == true) {
        await FirebaseFirestore.instance
            .collection("User cart")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("cart Item")
            .doc(product.id)
            .delete();
      } else {
        await FirebaseFirestore.instance
            .collection("User cart")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("cart Item")
            .doc(product.id)
            .update({"quantity": FieldValue.increment(-1)});
      }

      getSubtotal(product);
      Get.snackbar("Message", "Product removed from cart",
          backgroundColor: kred, colorText: kwhite);
    } on FirebaseException catch (e) {
      Get.snackbar("error", e.message.toString(),
          backgroundColor: kred, colorText: kwhite);
    } catch (e) {
      log(e.toString());
    }
  }

  getSubtotal(AddtoCart product) async {
    try {
      final totalcount = await FirebaseFirestore.instance
          .collection("User cart")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("cart Item")
          .doc(product.id)
          .get()
          .then((value) => value.data()!["quantity"]);
      final price = await FirebaseFirestore.instance
          .collection("User cart")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("cart Item")
          .doc(product.id)
          .get()
          .then((value) => value.data()!["price"]);
      log("product count is ${totalcount.toString()}");
      log("product price is ${price.toString()}");
      int subtotal = price * totalcount;

      await FirebaseFirestore.instance
          .collection("User cart")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("cart Item")
          .doc(product.id)
          .update({"subTotal": subtotal});
    } on FirebaseException catch (e) {
      Get.snackbar("error", e.message.toString(),
          backgroundColor: kred, colorText: kwhite);
    } catch (e) {
      log(e.toString());
    }
  }

  void grandTotalAmount() async {
    final QuerySnapshot<Map<String, dynamic>> value = await FirebaseFirestore
        .instance
        .collection("User cart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("cart Item")
        .get();
    if (value.docs.isNotEmpty) {
      final itemSubtotal = value.docs.map((e) => e.data()["subTotal"]).toList();

      for (int element in itemSubtotal) {
        allSubtotal.value += element;
      }
    }
  }
}
