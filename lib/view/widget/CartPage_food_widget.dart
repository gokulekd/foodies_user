// ignore: file_names
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/model/all_product_model.dart';

// ignore: must_be_immutable
class CartPageFoodDetails extends StatelessWidget {
  AllProductModel allProductModel;
  double height;
  double width;
  CartPageFoodDetails(
      {Key? key,
      required this.height,
      required this.width,
      required this.allProductModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 188, 205, 210),
            borderRadius: circle30),
        height: height * 0.15,
        width: width * 0.95,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                decoration: BoxDecoration(borderRadius: circle20),
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: circle20,
                  child: Image.network(
                    allProductModel.image.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            sizeW20,
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: SizedBox(
                    width: width * 0.6,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      allProductModel.productName.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  "Category : ${allProductModel.category.toString()}",
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  "₹ ${allProductModel.price.toString()}",
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 66, 149, 69)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
