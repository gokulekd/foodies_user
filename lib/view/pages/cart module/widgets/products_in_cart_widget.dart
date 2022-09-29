
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/controller/cart_controller.dart';
import 'package:foodies_user/model/all_product_model.dart';


class ProductsInCartWidget extends StatelessWidget {
  final CartController controller;
  final AllProductModel product;
  final int quantity;
 final int index;
  const ProductsInCartWidget({Key? key,required this.controller,required this.index,required this.product,required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(product.image!),
            ),
          ),
          sizeW10,
          Expanded(child: Text(product.productName!)),
          // IconButton(onPressed: (){controller.addProductToCart(product);}, icon: Icon(Icons.add)),
          Text("$quantity"),
              IconButton(onPressed: (){controller.removeProductFromCart(product);}, icon: const Icon(Icons.remove))



        ],
      ),
    );
    
  }
}