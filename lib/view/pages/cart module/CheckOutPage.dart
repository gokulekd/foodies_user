import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckOutPage extends StatefulWidget {
  final amount;
  final itemCount;

  const CheckOutPage({Key? key, required this.amount, required this.itemCount})
      : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  Razorpay? razorpay;

  @override
  void initState() {
    super.initState();
    razorpay = Razorpay();
    razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSucsess);
    razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFaliure);
    razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay!.clear();
  }

  void handlerPaymentSucsess() {
    log("Payment is succsess");
  }

  void handlerErrorFaliure() {
    log("Payment have error");
  }

  void handlerExternalWallet() {
    log("Payment is from external wallet");
  }

  void openCheckout()async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    var options = {
      "key": "rzp_test_4F11keT0DjZXl2",
      "amount": widget.amount,
      "name": firebaseUser!.displayName,
      "desscription": "payment for the foodies app",
      "prefill": {
        "contact": firebaseUser.phoneNumber,
        "email": firebaseUser.email,
      },
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      razorpay!.open(options);
    } catch (e) {
      log(">>>>Razorpay>>>error>>>$e");
    }
  }

  @override
  Widget build(BuildContext context) {

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Total Products : ${widget.itemCount}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Total Amount :  ₹ ${widget.amount}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Container(height: 200,
          child:Image.network("https://images.newindianexpress.com/uploads/user/imagelibrary/2022/5/10/w900X450/Razorpay.jpg?w=400&dpr=2.6"),),
          ElevatedButton(onPressed: ()async {
            openCheckout();


          }, child: const Text("Razorpay"))
        ],
      )),
    );
  }
}
