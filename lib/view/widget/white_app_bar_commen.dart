
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/style.dart';

AppBar whiteCustomAppBar(String title) {
  return AppBar(
    leading: const SizedBox(),
    title: Text(
      title,
      style: googleNormalFont,
    ),
    backgroundColor: kwhite,
    centerTitle: true,
  );
}
