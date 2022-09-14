import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/sized_box.dart';

import 'package:foodies_user/view/widget/TextFormFieldUserCredentials.dart';
import 'package:foodies_user/view/widget/fireBase_auth_Button.dart';
import 'package:foodies_user/view/widget/login_signup_button.dart';
import 'package:foodies_user/view/widget/signup_login_richText.dart';

class ScreenSignup extends StatelessWidget {
   ScreenSignup({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
   TextEditingController mobileController = TextEditingController();
    TextEditingController emailController = TextEditingController();
     TextEditingController passwordController = TextEditingController();
      TextEditingController confrimPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 200,
                  width: 250,
                  // color: Colors.black,
                  child: Image.asset(foodiesLogoImage),
                ),
              ),
              TextFormFieldUserCredentials(
                controller: nameController,
                obscure: false,
                  fieldTitle: "Name", prefixIconName: iconuser),
              TextFormFieldUserCredentials(
                controller: mobileController,
                obscure: false,
                  fieldTitle: "Mobile", prefixIconName: iconMobile),
              TextFormFieldUserCredentials(
                controller: emailController,
                obscure: false,
                  fieldTitle: "Email", prefixIconName: iconMail),
              TextFormFieldUserCredentials(
                controller: passwordController,
                obscure: true,
                  fieldTitle: "Enter Password",
                  prefixIconName: iconpassword,
                  sufixiconName: iconpasswordvisiblity),
              TextFormFieldUserCredentials(
                controller: confrimPasswordController,
                obscure: true,
                  fieldTitle: "confirm Password",
                  prefixIconName: iconpassword,
                  sufixiconName: iconpasswordvisiblity),
              sizeH20,
              LoginSignupButton(
                  onPressedFunction: () {
                  
                  
                  },
                  buttonColor: signupColor,
                  iconText: "Sign up"),
              sizeH30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  firebaseAuthButton(googleLogo, () {}),
                ],
              ),
              sizeH30,
              signupLoginRichText("Allready have an account", "login", () {}),
            ],
          ),
        ),
      ),
    );
  }
}
