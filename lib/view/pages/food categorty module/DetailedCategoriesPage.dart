import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/model/all_product_model.dart';
import 'package:foodies_user/view/pages/cart%20module/screen_cart.dart';
import 'package:foodies_user/view/pages/food%20categorty%20module/product_detailed_view.dart';
import 'package:foodies_user/view/widget/CartPage_food_widget.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DetailedCategoriesPage extends StatelessWidget {
  int categoryindex;

  DetailedCategoriesPage({
    Key? key,
    required this.categoryindex,
  }) : super(key: key);
  int value = 0;

  @override
  Widget build(BuildContext context) {
    var widthMedia = MediaQuery.of(context).size.width;
    var heightMedia = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: widthMedia,
          height: heightMedia,
          color: Colors.black,
          child: Stack(
            children: [
              SizedBox(
                width: widthMedia,
                height: 200,
                child: ClipRRect(
                  child: Image.asset(
                    categorisedBurgerNonVeg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
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
                              .data!.docs[categoryindex]["category Name"])
                          .snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              singleSnapshotofCategory) {
                        if (singleSnapshotofCategory.hasData) {
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: heightMedia * 0.73,
                              width: widthMedia,
                              decoration: const BoxDecoration(
                                color: KbargoundColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(40)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: ListView.separated(
                                  padding: const EdgeInsets.only(bottom: 150),
                                  itemCount: singleSnapshotofCategory
                                      .data!.docs.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: (() {
                                       Get.to(()=>ProductDetailedViewPage(categoriesIndex:categoryindex ,productIndex: index,));
                                       log(">>>>>>>>>>${index.toString()}");
                                      }
                                      ),
                                      child: CartPageFoodDetails(
                                        height: heightMedia,
                                        width: widthMedia,
                                        allProductModel: AllProductModel()
                                            .productFromJson(
                                                singleSnapshotofCategory
                                                    .data!.docs[index]),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) => sizeH20,
                                ),
                              ),
                            ),
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        color: kwhite,
                        borderRadius: circle20),
                    height: heightMedia * 0.12,
                    width: widthMedia * 0.9,
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Total Item In Cart : ${value.toString()}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Total Amount : ${value.toString()}",
                          style: const TextStyle(
                              fontSize: 18,
                              color: kred,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 53, 123, 101),

                          elevation: 3,
                          shape: RoundedRectangleBorder(borderRadius: circle25),
                          //  minimumSize: const Size(350, 40),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ScreenCart()));
                        },
                        child: const Text("View Cart"),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  addfoodtocart() {
    value++;
  }

  removefoodtocart() {
    value--;
  }
}

