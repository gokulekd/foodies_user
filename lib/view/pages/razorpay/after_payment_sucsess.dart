import 'package:flutter/material.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/view/pages/user%20profile%20module/pending%20orders/pending_orders_detailed_view.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class PaymentSucsessPage extends StatelessWidget {
  final amountPaid;
  final orderID;
  final PaymentTransactionID;

  const PaymentSucsessPage(
      {Key? key,
      required this.amountPaid,
      required this.orderID,
      required this.PaymentTransactionID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 350,
              width: 350,
              child: Lottie.network(
                  "https://assets3.lottiefiles.com/packages/lf20_vuliyhde.json",
                  fit: BoxFit.contain),
            ),
          ),
          Center(
            child: Text(
              " ₹ $amountPaid",
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          sizeH40,
          const Center(
            child: Text(
              "Payment successful",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          sizeH40,
          Center(
            child: Text(
              "order ID :$orderID",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          sizeH40,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 48, 116, 46),
                fixedSize: const Size(150, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed: () async {
              Get.off(() => const PendingOrdersDetailedViewPage());
            },
            child: const Text("Check Order Details"),
          ),
        ],
      )),
    );
  }
}
