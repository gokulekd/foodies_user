import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/model/add_to_cart.dart';
import 'package:foodies_user/model/all_product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final RxMap<AllProductModel, int> cartProducts = <AllProductModel, int>{}.obs;

  addProductToCart(AddtoCart product) async {
    var data = product.toJson();
    try {
      final alldata = await FirebaseFirestore.instance
          .collection("User cart")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("cart Item")
          .where("id", isEqualTo: product.id)
          .get();

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
            .set(data);
      }
    } on FirebaseException catch (e) {
      Get.snackbar("error", e.message.toString(),
          backgroundColor: kred, colorText: kwhite);
    } catch (e) {
      log(">>>>>Product add to cart Error>>>>${e.toString()}");
    }

    log(data.toString());
  }

  removeProductFromCart(AllProductModel product) async {
    if (cartProducts.containsKey(product) && cartProducts[product] == 1) {
      cartProducts.removeWhere((key, value) => key == product);
    } else {
      cartProducts[product] = cartProducts[product]! - 1;
    }
    log(cartProducts.toString());
    Get.snackbar(
      "Product Removed",
      "You Have Removed the ${product.productName} to the cart",
      snackPosition: SnackPosition.TOP,
    );
  }

  get subCount => cartProducts.entries
      .map((product) => product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toString();

  get subtotal => cartProducts.entries
      .map((product) => product.key.price! * product.value)
      .toList();

  get total => cartProducts.entries
      .map((product) => product.key.price! * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toString();
}
