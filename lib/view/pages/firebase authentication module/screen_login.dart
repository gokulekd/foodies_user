import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/view/pages/firebase%20authentication%20module/screen_signup.dart';
import 'package:foodies_user/view/widget/TextFormFieldUserCredentials.dart';
import 'package:foodies_user/view/widget/login_signup_button.dart';
import 'package:foodies_user/view/widget/signup_login_richText.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

class ScreenLogin extends StatelessWidget {
   ScreenLogin({Key? key}) : super(key: key);
  
    TextEditingController emailController = TextEditingController();
     TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 120,
                  width: 250,
                  child: Image.asset(foodiesLogoImage),
                ),
              ),
              Center(
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: Image.asset(loginPageBurger),
                ),
              ),
              TextFormFieldUserCredentials(
                controller: emailController,
                fieldTitle: "User name",
                prefixIconName: iconuser,
                obscure: false,
              ),
              TextFormFieldUserCredentials(
                controller: passwordController,
                  obscure: true,
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
                          builder: (context) =>  ScreenSignup()),
                    );
                  }),
              sizeH20,

              const Text("- - - - - OR - - - - -"),
                 sizeH20,
              SignInButton(buttonType: ButtonType.google, onPressed: (){log("google sing in clicked");}),
            
              sizeH30,
              signupLoginRichText(
                // ignore: unnecessary_string_escapes
                "Don\'t have an account?",
                "signup",
                () async {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
