import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/style.dart';
import 'package:foodies_user/services/firebase_signin_with_google_user.dart';
import 'package:foodies_user/view/widget/fireBase_auth_Button.dart';
import 'package:get/get.dart';

SizedBox customerDetailsProfile(double heightMedia, double widthMedia) {
  return SizedBox(
    height: heightMedia * 0.34,
    width: widthMedia * 0.95,
    child: Stack(
      children: [
        Positioned(
          top: 40,
          left: widthMedia * 0.025,
          child: Container(
            height: heightMedia * 0.27,
            width: widthMedia * 0.95,
            decoration: BoxDecoration(
              borderRadius: circle30,
              color: kwhite,
              border: Border.all(color: Colors.grey),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: widthMedia * 0.38,
          child: Container(
            decoration: BoxDecoration(borderRadius: circle10),
            height: 80,
            width: 80,
            child: Image.asset(userMale),
          ),
        ),
        Positioned(
          top: 100,
          left: widthMedia * 0.28,
          child: Text(
            "Customer ID : 4590",
            style: googleNormalFont,
          ),
        ),
        Positioned(
          top: 130,
          left: widthMedia * 0.37,
          child: Text(
            "Gokul K S",
            style: googleNormalFont,
          ),
        ),
        Positioned(
          top: 160,
          left: widthMedia * 0.13,
          child: Text(
            "Gokulofficialchennai@gmail.com",
            style: googleNormalFont,
          ),
        ),
        Positioned(
          top: 190,
          left: widthMedia * 0.31,
          child: Text(
            "+91 9656013606",
            style: googleNormalFont,
          ),
        ),
        Positioned(
          bottom: -4,
          left: widthMedia * 0.29,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.logout),
            style: ElevatedButton.styleFrom(
                primary: kred,
                fixedSize: const Size(150, 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            onPressed: () async {
              FirebaseSigninWithGoogleUser().gooleSignOUt();
              await FirebaseAuth.instance.signOut().then((value) async {
                Get.snackbar("Message", "User Log out Success",
                    backgroundColor: kgreen, colorText: Colors.white);
              });
            },
            label: const Text("Log out"),
          ),
        ),
      ],
    ),
  );
}
