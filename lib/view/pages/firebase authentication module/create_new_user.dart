import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/services/firebase_create_user_with_email.dart';
import 'package:foodies_user/services/firebase_signin_with_google_user.dart';
import 'package:foodies_user/view/pages/firebase%20authentication%20module/screen_login.dart';
import 'package:foodies_user/view/widget/TextFormFieldUserCredentials.dart';
import 'package:foodies_user/view/widget/login_signup_button.dart';
import 'package:foodies_user/view/widget/signup_login_richText.dart';
import 'package:get/get.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

class FirebaseCreateNewUser extends StatelessWidget {
  FirebaseCreateNewUser({Key? key}) : super(key: key);
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
                  height: 150,
                  width: 250,
                  // color: Colors.black,
                  child: Image.asset(foodiesLogoImage),
                ),
              ),
              TextFormFieldUserCredentials(
                  controller: nameController,
                  obscure: false,
                  fieldTitle: "Name",
                  prefixIconName: iconuser),
              TextFormFieldUserCredentials(
                  controller: mobileController,
                  obscure: false,
                  fieldTitle: "Mobile",
                  prefixIconName: iconMobile),
              TextFormFieldUserCredentials(
                  controller: emailController,
                  obscure: false,
                  fieldTitle: "Email",
                  prefixIconName: iconMail),
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
                  onPressedFunction: () async {
                    final name = nameController.text.trim();
                    final mobile = mobileController.text.trim();
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();
                    final confirmPassowrd =
                        confrimPasswordController.text.trim();
                    if (name.isEmpty ||
                        mobile.isEmpty ||
                        email.isEmpty ||
                        password.isEmpty ||
                        confirmPassowrd.isEmpty) {
                      Get.snackbar("oops...", "All the field is Required",
                          backgroundColor: kred, colorText: kwhite);
                    } else if (name.isNotEmpty &&
                        mobile.isNotEmpty &&
                        email.isNotEmpty &&
                        password.isNotEmpty &&
                        confirmPassowrd.isNotEmpty) {
                      if (password == confirmPassowrd) {
                        await FirebaseCreateUserWithEmail().createNewUser(
                            name: name,
                            mobile: mobile,
                            email: email,
                            password: password);
                     
                      }
                    }
                  },
                  buttonColor: signupColor,
                  iconText: "Sign up"),
              sizeH20,
              const Text("- - - - - OR - - - - -"),
              sizeH20,
              SignInButton(
                  buttonType: ButtonType.google,
                  onPressed: () async {
                    await FirebaseSigninWithGoogleUser().googleLogin();
                  }),
              sizeH30,
              signupLoginRichText("Allready have an account ?", "Login", () {
                Get.off(() => ScreenLogin());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
