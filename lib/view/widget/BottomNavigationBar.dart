import 'package:flutter/material.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/view/pages/Homepage%20module/screen_Homepage.dart';
import 'package:foodies_user/view/pages/cart%20module/screen_cart.dart';
import 'package:foodies_user/view/pages/food%20categorty%20module/screen_foods.dart';
import 'package:foodies_user/view/pages/user%20profile%20module/screen_user_profile.dart';


// ignore: must_be_immutable
class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int pageIndex = 0;

  final List<Widget> _pages = [
    const ScreenHomePage(),
    const Screenfoods(),
    const ScreenCart(),
    const ScreenUserProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 8,
        type: BottomNavigationBarType.fixed, // Fixed
        backgroundColor: Colors.white, // <-- This works for fixed
        selectedItemColor: const Color.fromARGB(255, 57, 162, 111),
        unselectedItemColor: Colors.grey,
        onTap: (int value) {
          setState(() {
            pageIndex = value;
          });
        },
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(iconHome)),
          BottomNavigationBarItem(label: "Foods", icon: Icon(iconFood)),
          BottomNavigationBarItem(label: "Cart", icon: Icon(iconCart)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(iconProfile)),
        ],
      ),
    );
  }
}
