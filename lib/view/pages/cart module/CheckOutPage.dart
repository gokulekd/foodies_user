
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/controller/order_traking_controller.dart';

import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class CheckOutPage extends StatefulWidget {
  final num amount;

  const CheckOutPage({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  Razorpay? razorpay;
    final ordercontroller = Get.put(OrderTrackingController());
  @override
  void initState() {
    super.initState();
    razorpay = Razorpay();
    razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentSuccess);
    razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlePaymentSuccess);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay!.clear();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response)async {
    
    Random objectname = Random();
final orderNumber = objectname.nextInt(500000).toString();
   final paymentTransactionID =   response.paymentId;
  
     
    ordercontroller.orderUnderConfirmation(grandTotal: widget.amount as double,paymentTransactionID:paymentTransactionID,orderID: orderNumber );
  
  }

  // ignore: unused_element
  void _handlePaymentError(PaymentFailureResponse response) {
      Get.snackbar("message", "payment failed",backgroundColor: kred,colorText: kwhite);
  }

  // ignore: unused_element
  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }
  void openCheckout() async {
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
    // ignore: empty_catches
    } catch (e) {
   
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 48, 116, 46),
          fixedSize: const Size(150, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      onPressed: () async {
        openCheckout();
      },
      child: const Text("Proceed to pay"),
    );
  }
}
