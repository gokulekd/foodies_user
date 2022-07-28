import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/view/pages/screen_Homepage.dart';
import 'package:foodies_user/view/widget/BottomNavigationBar.dart';
import 'package:foodies_user/view/widget/TextFormFieldUserCredentials.dart';
import 'package:foodies_user/view/widget/fireBase_auth_Button.dart';
import 'package:foodies_user/view/widget/login_signup_button.dart';
import 'package:foodies_user/view/widget/signup_login_richText.dart';

class ScreenSignup extends StatelessWidget {
  const ScreenSignup({Key? key}) : super(key: key);

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
                  fieldTitle: "Name", prefixIconName: iconuser),
              TextFormFieldUserCredentials(
                  fieldTitle: "Mobile", prefixIconName: iconMobile),
              TextFormFieldUserCredentials(
                  fieldTitle: "Email", prefixIconName: iconMail),
              TextFormFieldUserCredentials(
                  fieldTitle: "Enter Password",
                  prefixIconName: iconpassword,
                  sufixiconName: iconpasswordvisiblity),
              TextFormFieldUserCredentials(
                  fieldTitle: "confirm Password",
                  prefixIconName: iconpassword,
                  sufixiconName: iconpasswordvisiblity),
              sizeH20,
              LoginSignupButton(
                  onPressedFunction: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  CustomBottomNavigationBar()),
                );
                  },
                  buttonColor: signupColor,
                  iconText: "Sign Up"),
              sizeH30,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  firebaseAuthButton(facebookLogo, () {}),
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
