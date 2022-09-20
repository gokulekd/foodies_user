import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/model/all_product_model.dart';

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
                  child: Container( width: width * 0.6,
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
                  allProductModel.category.toString(),
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                Text(overflow: TextOverflow.ellipsis,
                  "₹ ${allProductModel.price.toString()}",
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 66, 149, 69)),
                ),
              ],
            )
          ],
        ),
        // child: Stack(
        //   children: [
        //     Positioned(
        //       top: 10,
        //       left: 10,
        //       child: Center(
        //         child: Container(
        //           decoration: BoxDecoration(
        //               image: const DecorationImage(
        //                   image: AssetImage(burgerNewArrival3),
        //                   fit: BoxFit.cover),
        //               color: Colors.blue,
        //               borderRadius: circle20),
        //           height: height * 0.12,
        //           width: width * 0.25,
        //         ),
        //       ),
        //     ),
        //      Positioned(
        //       top: 20,
        //       left: 140,
        //       child: Text(overflow: TextOverflow.ellipsis,
        //         allProductModel.productName.toString(),
        //         style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        //       ),
        //     ),
        //      Positioned(
        //       top: 70,
        //       left: 140,
        //       child: Text(
        //         "₹ ${allProductModel.price.toString()}",
        //         style: const TextStyle(
        //             fontSize: 22,
        //             fontWeight: FontWeight.bold,
        //             color: Color.fromARGB(255, 66, 149, 69)),
        //       ),
        //     ),
        //     Positioned(
        //       bottom: 10,
        //       left: 220,
        //       child: Row(
        //         children: [
        //           IconButton(
        //               onPressed: () {
        //                 // removefoodtocart();
        //               },
        //               icon: const Icon(Icons.remove_circle)),
        //           const Padding(
        //             padding: EdgeInsets.all(8.0),
        //             child: Text(
        //               "2",
        //               style: TextStyle(fontSize: 20),
        //             ),
        //           ),
        //           IconButton(
        //             onPressed: () {
        //               // addfoodtocart();
        //             },
        //             icon: const Icon(Icons.add_circle_outlined),
        //           )
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
