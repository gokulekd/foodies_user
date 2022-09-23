import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/view/widget/BurgerOfferWidget.dart';
import 'package:foodies_user/view/widget/CategoriesWidgetFoodspage.dart';
import 'package:foodies_user/view/widget/CustomAppBar.dart';
import 'package:foodies_user/view/widget/categories_title.dart';

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

          CategoryTitle(title: "offers", iconName: iconoffers),
          const BurgerOfferWidget(),
          CategoryTitle(title: "categories", iconName: iconFood),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("all Category")
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                    allCategorySnapshot) {
              if (allCategorySnapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: allCategorySnapshot.data!.docs.length,
                  itemBuilder: (context, mainIndex) {
                    return StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("ProductList")
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .collection(allCategorySnapshot.data!.docs[mainIndex]
                              ["category Name"])
                          .snapshots(),
                      builder: (context,
                          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                              singleSnapshotofCategory) {
                        if (singleSnapshotofCategory.hasData) {
                          return Column(
                            children: [
                              CategoriesWidgetFoodspage(
                                  index: mainIndex,
                                  streamName: FirebaseFirestore.instance
                                      .collection("all Category")
                                      .snapshots(),
                                  burgerType: allCategorySnapshot
                                      .data!.docs[mainIndex]["category Name"]),
                            ],
                          );
                        }
                        return const SizedBox();
                      },
                    );
                  },
                );
              }
              return const Center(
                child: SizedBox(
                  height: 50,
                  child: CircularProgressIndicator(),
                ),
              );
            },
          )
         
        ],
      )),
    );
  }
}
