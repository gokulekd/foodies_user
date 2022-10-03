import 'package:flutter/material.dart';
import 'package:foodies_user/constants/sized_box.dart';

import 'package:foodies_user/controller/cart_controller.dart';
import 'package:foodies_user/model/add_to_cart.dart';

class ProductsInCartWidget extends StatelessWidget {
  final CartController controller;
  final AddtoCart product;

  const ProductsInCartWidget({
    Key? key,
    required this.controller,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(product.image),
                ),
              ),
              sizeW10,
              Expanded(child: Text(product.name)),
              IconButton(
                  onPressed: () {
                    controller.getSubtotal(product);
                    controller.addProductToCart(product);
                  },
                  icon: const Icon(Icons.add)),
              Text(product.quantity.toString()),
              IconButton(
                  onPressed: () {
                    controller.getSubtotal(product);
                    controller.removeProductFromCart(product);
                  },
                  icon: const Icon(Icons.remove))
            ],
          ),
          Text("subTotal : ${product.subTotal!}"),
        ],
      ),
    );
  }
}
