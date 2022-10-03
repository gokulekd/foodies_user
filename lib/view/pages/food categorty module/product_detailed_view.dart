import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/constants/style.dart';
import 'package:foodies_user/controller/cart_controller.dart';
import 'package:foodies_user/model/add_to_cart.dart';
import 'package:foodies_user/model/all_product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductDetailedViewPage extends StatelessWidget {
  final int productIndex;
  final int categoriesIndex;
  ProductDetailedViewPage(
      {Key? key, required this.productIndex, required this.categoriesIndex})
      : super(key: key);
  CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Product Details",
          style: googleNormalFont,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 80),
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("all Category")
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                      allCategorySnapshot) {
                if (allCategorySnapshot.hasData) {
                  return StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("ProductList")
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .collection(allCategorySnapshot
                            .data!.docs[categoriesIndex]["category Name"])
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            singleSnapshotofCategory) {
                      if (singleSnapshotofCategory.hasData) {
                        AllProductModel value = AllProductModel()
                            .productFromJson(singleSnapshotofCategory
                                .data!.docs[productIndex]);
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            sizeH10,
                            Container(
                              decoration: BoxDecoration(borderRadius: circle20),
                              height: heightMedia * 0.29,
                              width: widthMedia * 0.8,
                              child: ClipRRect(
                                borderRadius: circle20,
                                child: Image.network(
                                  value.image.toString(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      value.productName.toString(),
                                      style: googleNormalFont,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      value.category.toString(),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "₹ ${value.price!.toString()}",
                                      style: const TextStyle(
                                        color: kgreen,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  sizeH10,
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Discripton",
                                      style: normalfont15,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      value.discription.toString(),
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            sizeH50,
                            ElevatedButton(
                              onPressed: () {
                                final model = AddtoCart(
                                  id: value.id!,
                                  name: value.productName!,
                                  price: value.price!,
                                  image: value.image.toString(),
                                  quantity: 1,
                                );
                                controller.addProductToCart(model);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary:
                                      const Color.fromARGB(255, 48, 96, 45),
                                  fixedSize: const Size(200, 50),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              child: const Text('Add to Cart'),
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    },
                  );
                }
                return const Center(
                  child: SizedBox(
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
