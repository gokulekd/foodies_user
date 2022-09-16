
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/images.dart';

class HomepageCustomAppBar extends StatelessWidget {
  const HomepageCustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return AppBar(
    backgroundColor: kwhite,
    leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: Icon(
          iconMenu,
          color: loginColor,
          size: 30,
        )),
    centerTitle: true,
    title:
        SizedBox(height: 60, width: 140, child: Image.asset(foodiesLogoImage)),
    toolbarHeight: 80,
   
  );
}
}