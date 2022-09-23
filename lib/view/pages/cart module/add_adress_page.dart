
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/controller/manage_adress.dart';
import 'package:foodies_user/model/adressmodel.dart';
import 'package:foodies_user/view/widget/TextFormFieldUserCredentials.dart';
import 'package:foodies_user/view/widget/login_signup_button.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddAdressPage extends StatelessWidget {
  AddAdressPage({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController houseNameController = TextEditingController();
  TextEditingController roadNameController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Add New Adress",
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
              onPressedFunction: () async {
                final name = nameController.text.trim();
                final mobile = mobileController.text.trim();
                final houseName = houseNameController.text.trim();
                final roadName = roadNameController.text.trim();
                final landMark = landmarkController.text.trim();
                if (name.isEmpty ||
                    houseName.isEmpty ||
                    mobile.isEmpty ||
                    roadName.isEmpty ||
                    landMark.isEmpty) {
                  Get.snackbar("error", "all fields are redqured",
                      backgroundColor: kred, colorText: kwhite);
                }
                else{
              final addressData =   AdressModel(name: name, mobile: mobile, houseName: houseName, areaNo: roadName, landMark: landMark);
                await ManageAdress().addAdress(addressData);
                }
              },
              buttonColor: loginColor,
              iconText: "Add adress")
        ],
      )),
    );
  }
}
