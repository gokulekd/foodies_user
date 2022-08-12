import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/view/pages/drawer/navigation_drawer.dart';
import 'package:foodies_user/view/widget/BurgerOfferWidget.dart';
import 'package:foodies_user/view/widget/CommonBurgerShowWidget.dart';
import 'package:foodies_user/view/widget/Current_Location_Homepage.dart';
import 'package:foodies_user/view/widget/CustomAppBar.dart';
import 'package:foodies_user/view/widget/categories_title.dart';
import 'package:foodies_user/view/widget/searchBar.dart';

class ScreenHomePage extends StatelessWidget {
  const ScreenHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      backgroundColor: KbargoundColor,
      appBar: const PreferredSize(
        preferredSize: 
        Size.fromHeight(80),
        child: HomepageCustomAppBar(),
        ),
      body: SafeArea(
          child: ListView(
        children: [
          
          const CurrentLocation(),
          const SearchBar(),
          CategoryTitle(title: "Offers", iconName: iconoffers),
          const BurgerOfferWidget(),
          CategoryTitle(title: "Popular Foods", iconName: iconPoularFood),
          CommonBurgerShowWidget(imagelist: burgerpopularList),
          CategoryTitle(title: "New Arrivals", iconName: iconPoularRestaurant),
          CommonBurgerShowWidget(imagelist: burgerNewArrivalList),
        ],
      )),
    );
  }
}
