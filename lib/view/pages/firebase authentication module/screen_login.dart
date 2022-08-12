import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/view/pages/firebase%20authentication%20module/screen_signup.dart';
import 'package:foodies_user/view/widget/TextFormFieldUserCredentials.dart';
import 'package:foodies_user/view/widget/fireBase_auth_Button.dart';
import 'package:foodies_user/view/widget/login_signup_button.dart';
import 'package:foodies_user/view/widget/signup_login_richText.dart';

class ScreenLogin extends StatelessWidget {
  const ScreenLogin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 150,
                  width: 250,
                  child: Image.asset(foodiesLogoImage),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 270,
                  width: 270,
                  child: Image.asset(loginPageBurger),
                ),
              ),
              TextFormFieldUserCredentials(
                  fieldTitle: "User ID", prefixIconName: iconuser),
              TextFormFieldUserCredentials(
                  fieldTitle: "Password",
                  prefixIconName: iconpassword,
                  sufixiconName: iconpasswordvisiblity),
              sizeH10,
              LoginSignupButton(
                  buttonColor: loginColor,
                  iconText: "Log in",
                  onPressedFunction: () {
                         Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ScreenSignup()),
                  );
                  }),
              sizeH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  firebaseAuthButton(facebookLogo, () {}),
                  firebaseAuthButton(googleLogo, () {}),
                ],
              ),
              sizeH30,
              signupLoginRichText(
                // ignore: unnecessary_string_escapes
                "Don\'t have an account?",
                "signup",
                () async {
             
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
