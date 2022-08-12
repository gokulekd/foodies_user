import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/view/widget/TextFormFieldUserCredentials.dart';
import 'package:foodies_user/view/widget/login_signup_button.dart';

class UpdateAdressPage extends StatelessWidget {
  const UpdateAdressPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Update adress",
          style: TextStyle(color: kblack),
        ),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          sizeH10,
          TextFormFieldUserCredentials(
              fieldTitle: "Name", prefixIconName: iconuser),
          sizeH10,
          TextFormFieldUserCredentials(
              fieldTitle: "Mobile", prefixIconName: iconMobile),
          sizeH10,
          TextFormFieldUserCredentials(
              fieldTitle: "House/flat/Block No", prefixIconName: Icons.home),
          sizeH10,
          TextFormFieldUserCredentials(
              fieldTitle: "Appartment/Road/Area No",
              prefixIconName: Icons.apartment),
          sizeH10,
          TextFormFieldUserCredentials(
              fieldTitle: "Nearby Landmark(Optional)",
              prefixIconName: Icons.location_on_sharp),
          sizeH100,
          LoginSignupButton(
              onPressedFunction: () {},
              buttonColor: loginColor,
              iconText: "update adress")
        ],
      )),
    );
  }
}
