import 'package:flutter/material.dart';
import 'package:foodies_user/view/pages/cart%20module/screen_cart.dart';
import 'package:foodies_user/view/pages/firebase%20authentication%20module/screen_splash.dart';
import 'package:responsive_framework/responsive_framework.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, Widget) => ResponsiveWrapper.builder(
          ClampingScrollWrapper.builder(context, Widget!),
          breakpoints: const [
            ResponsiveBreakpoint.resize(350, name: MOBILE),
            ResponsiveBreakpoint.autoScale(600, name: TABLET),
            ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ]),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const ScreenSplash(),
      // home: ScreenCart(),
   
    );
  }
}
