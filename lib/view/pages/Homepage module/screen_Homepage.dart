
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/model/all_product_model.dart';
import 'package:foodies_user/view/pages/drawer/navigation_drawer.dart';
import 'package:foodies_user/view/pages/food%20categorty%20module/DetailedCategoriesPage.dart';
import 'package:foodies_user/view/widget/BurgerOfferWidget.dart';
import 'package:foodies_user/view/widget/CommonBurgerShowWidget.dart';
import 'package:foodies_user/view/widget/CustomAppBar.dart';
import 'package:foodies_user/view/widget/categories_title.dart';
import 'package:get/get.dart';

class ScreenHomePage extends StatelessWidget {
  const ScreenHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawer(),
      backgroundColor: kbargoundColor,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: HomepageCustomAppBar(),
      ),
      body: CustomScrollView(
        slivers: [
      
          SliverToBoxAdapter(
              child: CategoryTitle(title: "offers", iconName: iconoffers)),
          const SliverToBoxAdapter(child: BurgerOfferWidget()),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, i) {
              return StreamBuilder(
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
                              .collection(allCategorySnapshot
                                  .data!.docs[mainIndex]["category Name"])
                              .snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                  singleSnapshotofCategory) {
                            if (singleSnapshotofCategory.hasData) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(() => DetailedCategoriesPage(
                                          categoryindex: mainIndex));
                                    },
                                    child: CategoryTitle(
                                      iconName: Icons.food_bank,
                                      title: allCategorySnapshot.data!
                                          .docs[mainIndex]["category Name"],
                                    ),
                                  ),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 5 / 6.5,
                                            crossAxisSpacing: 1,
                                            mainAxisSpacing: 1),
                                    itemCount: 2,
                                    itemBuilder: (BuildContext ctx, index) {
                                      return CommonBurgerShowWidget(
                                        productIndex: index,
                                        categoryIndex: mainIndex,
                                        allProductModel: AllProductModel()
                                            .productFromJson(
                                                singleSnapshotofCategory
                                                    .data!.docs[index]),
                                      );
                                    },
                                  ),
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
              );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}
