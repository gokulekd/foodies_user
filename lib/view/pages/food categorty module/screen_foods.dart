import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/view/widget/BurgerOfferWidget.dart';
import 'package:foodies_user/view/widget/CategoriesWidgetFoodspage.dart';
import 'package:foodies_user/view/widget/CustomAppBar.dart';
import 'package:foodies_user/view/widget/categories_title.dart';
import 'package:foodies_user/view/widget/searchBar.dart';

class Screenfoods extends StatelessWidget {
  const Screenfoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KbargoundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: HomepageCustomAppBar(),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          sizeH10,
          const SearchBar(),
          CategoryTitle(title: "offers", iconName: iconoffers),
          const BurgerOfferWidget(),
          CategoryTitle(title: "categories", iconName: iconFood),
            CategoriesWidgetFoodspage(burgerType: "New Arrivals"),
          CategoriesWidgetFoodspage(burgerType: "Non-Veg Burger"),
          CategoriesWidgetFoodspage(burgerType: "Veg Burger"),
           

        ],
      )),
    );
  }
}
