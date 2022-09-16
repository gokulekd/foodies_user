import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/model/all_product_model.dart';
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
        preferredSize: Size.fromHeight(80),
        child: HomepageCustomAppBar(),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const CurrentLocation(),
            const SearchBar(),
            CategoryTitle(title: "Offers", iconName: iconoffers),
            const BurgerOfferWidget(),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("all Category")
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                      allCategorySnapshot) {
                if (allCategorySnapshot.hasData) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
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
                            if (singleSnapshotofCategory.connectionState ==
                                ConnectionState.none) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (singleSnapshotofCategory.data == null) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                            if (singleSnapshotofCategory.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (singleSnapshotofCategory
                                .data!.docs.isEmpty) {
                              return const Center(
                                child: Text(
                                  'No Data',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                ),
                              );
                            }

                            return Center(
                              child: Container(
                                height: 316,
                                child: Column(
                                  children: [
                                    CategoryTitle(   
                                        title: allCategorySnapshot
                                            .data!.docs[mainIndex]["category Name"],
                                        iconName: iconPoularFood),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: 243,
                                          width: double.infinity,
                                          child: ListView.builder(
                                            shrinkWrap: true,
                                               scrollDirection: Axis.horizontal,
                                            // physics:
                                            //     const NeverScrollableScrollPhysics(),
                                            padding: const EdgeInsets.only(
                                                top: 5, bottom: 0),
                                            itemCount: singleSnapshotofCategory
                                                .data!.docs.length,
                                            itemBuilder: (context, index) {
                                              return CommonBurgerShowWidget(
                                                allProductModel: AllProductModel()
                                                    .productFromJson(
                                                        singleSnapshotofCategory
                                                            .data!.docs[index]),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                } else if (allCategorySnapshot.connectionState ==
                    ConnectionState.waiting) {
                  const SizedBox(
                      child: Center(child: CircularProgressIndicator()));
                }
                return const SizedBox(
                  child: Center(
                    child: Text(
                      "No data",
                    ),
                  ),
                );
              },
            ),
          ],
        ),

        // CommonBurgerShowWidget(imagelist: burgerpopularList,title: ""),
        //   CommonBurgerShowWidget(imagelist: burgerpopularList,title: " "),
        //      CommonBurgerShowWidget(imagelist: burgerpopularList,title: ""),
      ),
    );
  }
}
