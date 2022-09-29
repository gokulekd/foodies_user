import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodies_user/model/all_product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final RxMap<AllProductModel, int> cartProducts = <AllProductModel, int>{}.obs;

  addProductToCart(AllProductModel product) async {
  



    if (cartProducts.containsKey(product.productName)) {
      cartProducts[product] = cartProducts[product]! + 1;
      
    } else {
      cartProducts[product] = 1;
    }
   
    try {
      await FirebaseFirestore.instance
          .collection("user cart")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "productName": product.productName!.toString(),
        "itemCount": cartProducts.value.values.toString()
      });
    } on FirebaseException catch (e) {
      log(e.message.toString());
    } catch (e) {
      log(e.toString());
    }
    log(cartProducts.value.toString());
    Get.snackbar(
      "Product added",
      "You Have added the ${product.productName!.toString()} to the cart",
      snackPosition: SnackPosition.TOP,
    );

    // });
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
