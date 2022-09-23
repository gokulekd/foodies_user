import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodies_user/model/all_product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartProducts = {}.obs;
  addProductToCart(AllProductModel product) async {
    if (cartProducts.containsKey(product)) {
      cartProducts[product] += 1;
    } else {
      cartProducts[product] = 1;
    }
    log(cartProducts.toString());
    Get.snackbar(
      "Product added",
      "You Have added the ${product.productName} to the cart",
      snackPosition: SnackPosition.TOP,
    );
  }

  removeProductFromCart(AllProductModel product) async {
    if (cartProducts.containsKey(product) && cartProducts[product] == 1) {
      cartProducts.removeWhere((key, value) => key == product);
    } else {
      cartProducts[product] -= 1;
    }
    log(cartProducts.toString());
    Get.snackbar(
      "Product Removed",
      "You Have Removed the ${product.productName} to the cart",
      snackPosition: SnackPosition.TOP,
    );
  }
  get subCount=>cartProducts.entries
  .map((product) => product.value).toList().reduce((value, element) => value+ element).toString();

  get subtotal => cartProducts.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => cartProducts.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toString();
}
