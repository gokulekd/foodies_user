

import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';

import 'package:foodies_user/model/all_product_model.dart';
import 'package:foodies_user/view/pages/food%20categorty%20module/product_detailed_view.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CommonBurgerShowWidget extends StatelessWidget {
  AllProductModel allProductModel;
  int productIndex;
  int categoryIndex;
  CommonBurgerShowWidget(
      {Key? key,
      required this.allProductModel,
      required this.productIndex,
      required this.categoryIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDetailedViewPage(
            productIndex: productIndex, categoriesIndex: categoryIndex));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 300,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  allProductModel.image!.isEmpty
                      ? Container(
                          height: 200,
                          width: 90,
                          decoration: BoxDecoration(
                            borderRadius: circle10,
                          ),
                          child: ClipRRect(
                              borderRadius: circle30,
                              child: const CircularProgressIndicator()),
                        )
                      : Container(
                          height: 300,
                          width: 190,
                          decoration: BoxDecoration(
                            borderRadius: circle10,
                          ),
                          child: ClipRRect(
                            borderRadius: circle30,
                            child: Image.network(
                              allProductModel.image.toString(),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30)),
                      ),
                      height: 65,
                      width: 165,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              overflow: TextOverflow.ellipsis,
                              allProductModel.productName.toString(),
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                " ₹ ${allProductModel.price.toString()}",
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: kred),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
