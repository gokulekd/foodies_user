import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/images.dart';

class CartPageFoodDetails extends StatelessWidget {
  var height;

  var width;

  CartPageFoodDetails({Key? key, required this.height, required this.width})
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
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 10,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(burgerNewArrival3),
                          fit: BoxFit.cover),
                      color: Colors.blue,
                      borderRadius: circle20),
                  height: height * 0.12,
                  width: width * 0.25,
                ),
              ),
            ),
            const Positioned(
              top: 20,
              left: 140,
              child: Text(
                "Cheese Chiken Burger",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Positioned(
              top: 70,
              left: 140,
              child: Text(
                "₹ 400",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 66, 149, 69)),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 220,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        // removefoodtocart();
                      },
                      icon: const Icon(Icons.remove_circle)),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "2",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // addfoodtocart();
                    },
                    icon: const Icon(Icons.add_circle_outlined),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
