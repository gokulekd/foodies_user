import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/services/firebase_signin_with_google_user.dart';
import 'package:foodies_user/services/firebase_email_login_user.dart';
import 'package:foodies_user/view/pages/firebase%20authentication%20module/create_new_user.dart';
import 'package:foodies_user/view/widget/TextFormFieldUserCredentials.dart';
import 'package:foodies_user/view/widget/login_signup_button.dart';
import 'package:foodies_user/view/widget/signup_login_richText.dart';
import 'package:get/get.dart';
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
                  onPressedFunction: () async {
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();
                    if (email.isEmpty || password.isEmpty) {
                      Get.snackbar("oops...", "All the field is Required",
                          backgroundColor: kred, colorText: kwhite);
                    } else if (email.isNotEmpty && password.isNotEmpty) {
                      await FirebaseEmailLoginUser()
                          .userLogin(email, password);
                    }
                  }),
              sizeH20,
              const Text("- - - - - OR - - - - -"),
              sizeH20,
              SignInButton(
                  buttonType: ButtonType.google,
                  onPressed: () async {
                    await FirebaseSigninWithGoogleUser().googleLogin();
                  }),
              sizeH30,
              signupLoginRichText("Don't  have an account ?", "Signup", () {
                Get.to(() => FirebaseCreateNewUser());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
