import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/sized_box.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kwhite,
        title: const Text(
          "Payments",
          style: TextStyle(color: kblack),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          sizeH10,
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Total Products : 2",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Total Amount :  ₹ 452",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: heightMedia * 0.32,
              width: widthMedia * 0.95,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: circle20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Select payment Mode",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: kblack,
                  ),
                  ListTile(
                    leading: Image.asset(googlepay),
                    title: const Text(
                      "Google Pay",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: kblack,
                  ),
                  ListTile(
                    leading: Image.asset(paytm),
                    title: const Text(
                      "Paytm",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Divider(
                    thickness: 0.5,
                    color: kblack,
                  ),
                  ListTile(
                    leading: Image.asset(cashOnDelivery),
                    title: const Text(
                      "Cash On Delivery",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
