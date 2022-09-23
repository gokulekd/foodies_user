import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:foodies_user/model/all_product_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartProducts = {}.obs;
  addProductToCart(AllProductModel product) async {
  await  FirebaseFirestore.instance
        .collection("Shopping cart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("items")
        .add(product.ProductToJson());

    // if (cartProducts.containsKey(product)) {
    //   cartProducts[product] += 1;
    // } else {
    //   cartProducts[product] = 1;
    // }
    // Get.snackbar("Product added",
    //     "You Have added the ${product.productName} to the cart",
    //     snackPosition: SnackPosition.TOP,
    //     );
  }

  void removeProductFromCart(AllProductModel product) {
    if (cartProducts.containsKey(product) && cartProducts[product] == 1) {
      cartProducts.removeWhere((key, value) => key == product);
    } else {
      cartProducts[product] -= 1;
    }
  }
}
