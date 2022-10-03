// ignore: file_names

import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/view/pages/Homepage%20module/screen_search.dart';
import 'package:get/get.dart';


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
      title: SizedBox(
          height: 60, width: 140, child: Image.asset(foodiesLogoImage)),
      toolbarHeight: 80,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              height: 50,
              width: 50,
              decoration:
                  BoxDecoration(borderRadius: circle40, color: loginColor),
              child: IconButton(
                onPressed: () {Get.to(()=>const ScreenSearch());},
                icon: const Icon(
                  Icons.search_outlined,
                  color: kwhite,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
