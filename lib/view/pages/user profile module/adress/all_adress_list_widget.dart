import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/icons.dart';




 Container adressTypeHome() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black), borderRadius: circle5),
      child: Icon(iconHome));
  }

 Container adressTypWork() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black), borderRadius: circle5),
      child: Icon(iconOffice));
  }

 Container adressTypeOther() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black), borderRadius: circle5),
      child: Icon(iconOther));
  }

