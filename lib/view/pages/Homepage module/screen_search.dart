import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/view/widget/white_app_bar_commen.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: whiteCustomAppBar("Search Products"),
    );
  }
}
