import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/view/widget/TextFormFieldUserCredentials.dart';
import 'package:foodies_user/view/widget/login_signup_button.dart';

class AddAdressPage extends StatelessWidget {
   AddAdressPage({Key? key}) : super(key: key);
  
   TextEditingController nameController = TextEditingController();
   TextEditingController mobileController = TextEditingController();
    TextEditingController houseNameController = TextEditingController();
     TextEditingController roadNameController = TextEditingController();
          TextEditingController landmarkController = TextEditingController();
               TextEditingController discriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("Add New Adress",style: TextStyle(color:kblack),),
      ),
      body: SafeArea(
          child: ListView(
        children: [
            sizeH10,

          TextFormFieldUserCredentials(
            controller: nameController,
            obscure: false,
              fieldTitle: "Name", prefixIconName: iconuser),
                sizeH10,

          TextFormFieldUserCredentials(
            controller: mobileController,
            obscure: false,
              fieldTitle: "Mobile", prefixIconName:iconMobile),
          sizeH10,

          TextFormFieldUserCredentials(
            obscure: false,
              fieldTitle: "House/flat/Block No", prefixIconName: Icons.home),
                 sizeH10,
          TextFormFieldUserCredentials(
            obscure: false,
              fieldTitle: "Appartment/Road/Area No",
              prefixIconName: Icons.apartment),
                 sizeH10,
          TextFormFieldUserCredentials(
            obscure: false,
              fieldTitle: "Nearby Landmark(Optional)",
              prefixIconName: Icons.location_on_sharp),
              sizeH100,
          LoginSignupButton(
              onPressedFunction: () {},
              buttonColor: loginColor,
              iconText: "Add adress")
        ],
      )),
    );
  }
}
