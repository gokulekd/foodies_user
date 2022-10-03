// ignore: file_names
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';


InkWell firebaseAuthButton(
  String buttonLogo, VoidCallback onPressedFunction
) {
    return InkWell(
              onTap: onPressedFunction,
              child: Container(
                height: 40,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: circle45,
                 border: Border.all(color: loginColor)
                ),
                child: Image.asset(buttonLogo,fit: BoxFit.contain),


              ),
             );
  }