import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class PaymentFailurePage extends StatelessWidget {
  const PaymentFailurePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Lottie.network(
              "https://assets8.lottiefiles.com/packages/lf20_ph09qu41.json")),
    );
  }
}
