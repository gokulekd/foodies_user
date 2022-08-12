import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/view/pages/cart%20module/screen_cart.dart';

Padding deliveryAdressViewWidget(
    double heightMedia, double widthMedia, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: heightMedia * 0.2,
      width: widthMedia * 0.95,
      decoration: BoxDecoration(
        borderRadius: circle30,
        color: kwhite,
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        children: [
          sizeH10,
          const Text(
            "Deliver To",
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          const Divider(
            thickness: 0.5,
            color: kblack,
          ),
          sizeH10,
          ListTile(
            leading: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: circle5),
                child: Icon(iconHome)),
            title: const Text(
              "Home",
            ),
            subtitle: const Text(
                "Gokulam House,ennakad po,chengannur -689624,alappuzha,kerala"),
            trailing: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: loginColor,
                  fixedSize: const Size(90, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50))),
              onPressed: () {
              adressSelectorWidget(context);
              },
              child: const Text("change"),
            ),
          ),
        ],
      ),
    ),
  );
}
