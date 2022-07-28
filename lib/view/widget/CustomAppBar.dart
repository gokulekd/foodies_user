
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
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
        onPressed: () {},
        icon: Icon(
          iconMenu,
          color: loginColor,
          size: 30,
        )),
    centerTitle: true,
    title:
        SizedBox(height: 60, width: 140, child: Image.asset(foodiesLogoImage)),
    toolbarHeight: 80,
    actions: [
   
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: circle60, border: Border.all(color: loginColor)),
            width: 45,
            height: 45,
            child: ClipRRect(
                borderRadius: circle60,
                child: Image.asset(
                  foodiesSmallLogo,
                  fit: BoxFit.contain,
                )),
          ),
        ),
      )
    ],
  );
}
}