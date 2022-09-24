import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/view/widget/TextFormFieldUserCredentials.dart';
import 'package:foodies_user/view/widget/login_signup_button.dart';

// ignore: must_be_immutable
class UpdateAdressPage extends StatelessWidget {
  UpdateAdressPage({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController mobileController = TextEditingController(text: "");
  TextEditingController houseNameController = TextEditingController(text: "");
  TextEditingController roadNameController = TextEditingController(text: "");
  TextEditingController landmarkController = TextEditingController(text: "");
  TextEditingController discriptionController = TextEditingController(text: "");
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
                controller: nameController,
                obscure: false,
                fieldTitle: "Name",
                prefixIconName: iconuser),
            sizeH10,
            TextFormFieldUserCredentials(
                controller: mobileController,
                obscure: false,
                fieldTitle: "Mobile",
                prefixIconName: iconMobile),
            sizeH10,
            TextFormFieldUserCredentials(
                controller: houseNameController,
                obscure: false,
                fieldTitle: "House/flat/Block No",
                prefixIconName: Icons.home),
            sizeH10,
            TextFormFieldUserCredentials(
                controller: roadNameController,
                obscure: false,
                fieldTitle: "Appartment/Road/Area No",
                prefixIconName: Icons.apartment),
            sizeH10,
            TextFormFieldUserCredentials(
                controller: landmarkController,
                obscure: false,
                fieldTitle: "Nearby Landmark(Optional)",
                prefixIconName: Icons.location_on_sharp),
            sizeH100,
            LoginSignupButton(
                onPressedFunction: () {},
                buttonColor: loginColor,
                iconText: "update adress")
          ],
        ),
      ),
    );
  }
}
