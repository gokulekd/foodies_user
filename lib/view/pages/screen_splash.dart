import 'package:flutter/material.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/view/pages/screen_login.dart';
import 'package:foodies_user/view/widget/BottomNavigationBar.dart';
import 'package:lottie/lottie.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   navigate(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Container(
                height: 200,
                width: 300,
                child: Lottie.asset(foodiesLogoJson),
              ),
            ),
            Center(
              child: Container(
                  // color: Colors.black,
                  height: 350,
                  width: 350,
                  child: Image.asset(
                  splashScreenBurger,
                    fit: BoxFit.cover,
                  )),
            ),
     
             Center(


                child: Container(
                  height: 150,
                  width: 150,
                  child: Lottie.asset(splashLoadingJson,height: 100,width: 100,fit: BoxFit.cover)),
              ),
            
          ],
        ),
      ),
    );
  }
}

navigate(context) async {
  await Future.delayed(const Duration(seconds: 5));
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>   ScreenLogin()),
  );
}
