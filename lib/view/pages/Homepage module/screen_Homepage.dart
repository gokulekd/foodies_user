import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/model/all_product_model.dart';
import 'package:foodies_user/view/pages/drawer/navigation_drawer.dart';
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
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: CurrentLocation(),
          ),
          const SliverToBoxAdapter(
            child: SearchBar(),
          ),
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
                      itemCount: 5,
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
                                  CategoryTitle(
                                    iconName: Icons.food_bank,
                                    title: allCategorySnapshot
                                        .data!.docs[mainIndex]["category Name"],
                                  ),
                                  GridView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 10 / 9,
                                              crossAxisSpacing: 16,
                                              mainAxisSpacing: 20),
                                      itemCount: singleSnapshotofCategory
                                          .data!.docs.length,
                                      itemBuilder: (BuildContext ctx, index) {
                                        return CommonBurgerShowWidget(
                                          allProductModel: AllProductModel()
                                              .productFromJson(
                                                  singleSnapshotofCategory
                                                      .data!.docs[index]),
                                        );

                                        //  Padding(
                                        //   padding: const EdgeInsets.all(8.0),
                                        //   child: ListView.builder(

                                        //     physics:
                                        //         const NeverScrollableScrollPhysics(),
                                        //     itemCount: singleSnapshotofCategory
                                        //         .data!.docs.length,
                                        //     shrinkWrap: true,
                                        //     itemBuilder: (context, index) {
                                        //       return CommonBurgerShowWidget(
                                        //         allProductModel: AllProductModel()
                                        //             .productFromJson(
                                        //                 singleSnapshotofCategory
                                        //                     .data!.docs[index]),
                                        //       );
                                        //     },
                                        //   ),
                                        // );
                                      }),
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

    // return Scaffold(
    //   drawer: const NavigationDrawer(),
    //   backgroundColor: KbargoundColor,
    //   appBar: const PreferredSize(
    //     preferredSize: Size.fromHeight(80),
    //     child: HomepageCustomAppBar(),
    //   ),
    //   body: SafeArea(
    //     child: CustomScrollView(slivers: [
    //       const CurrentLocation(),
    //       const SearchBar(),
    //       CategoryTitle(title: "Offers", iconName: iconoffers),
    //       const BurgerOfferWidget(),
    //       StreamBuilder(
    //         stream: FirebaseFirestore.instance
    //             .collection("all Category")
    //             .snapshots(),
    //         builder: (context,
    //             AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
    //                 allCategorySnapshot) {
    //           if (allCategorySnapshot.hasData) {
    //             return SliverList(
    //               delegate: SliverChildBuilderDelegate(
    //                   // itemCount: allCategorySnapshot.data!.docs.length,
    //                   (context, mainIndex) {
    //                 return StreamBuilder(
    //                   stream: FirebaseFirestore.instance
    //                       .collection("ProductList")
    //                       .doc(FirebaseAuth.instance.currentUser!.uid)
    //                       .collection(allCategorySnapshot.data!.docs[mainIndex]
    //                           ["category Name"])
    //                       .snapshots(),
    //                   builder: (context,
    //                       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
    //                           singleSnapshotofCategory) {
    //                     if (singleSnapshotofCategory.connectionState ==
    //                         ConnectionState.none) {
    //                       return const Center(
    //                         child: CircularProgressIndicator(),
    //                       );
    //                     } else if (singleSnapshotofCategory.data == null) {
    //                       return const Center(
    //                           child: CircularProgressIndicator());
    //                     }
    //                     if (singleSnapshotofCategory.connectionState ==
    //                         ConnectionState.waiting) {
    //                       return const Center(
    //                         child: CircularProgressIndicator(),
    //                       );
    //                     } else if (singleSnapshotofCategory
    //                         .data!.docs.isEmpty) {
    //                       return const Center(
    //                         child: Text(
    //                           'No Data',
    //                           style: TextStyle(
    //                               color: Color.fromARGB(255, 0, 0, 0)),
    //                         ),
    //                       );
    //                     }

    //                     return Center(
    //                       child: Container(
    //                         height: 316,
    //                         child: Column(
    //                           children: [
    //                             CategoryTitle(
    //                                 title: allCategorySnapshot
    //                                     .data!.docs[mainIndex]["category Name"],
    //                                 iconName: iconPoularFood),
    //                             SliverList(
    //                               delegate: SliverChildBuilderDelegate(
    //                                   (context, index) {
    //                                 return CommonBurgerShowWidget(
    //                                   allProductModel: AllProductModel()
    //                                       .productFromJson(
    //                                           singleSnapshotofCategory
    //                                               .data!.docs[index]),
    //                                 );
    //                               },
    //                                   childCount: singleSnapshotofCategory
    //                                       .data!.docs.length),
    //                             )
    //                           ],
    //                         ),
    //                       ),
    //                     );
    //                   },
    //                 );
    //               }, childCount: allCategorySnapshot.data!.docs.length),
    //             );
    //           } else if (allCategorySnapshot.connectionState ==
    //               ConnectionState.waiting) {
    //             const SizedBox(
    //                 child: Center(child: CircularProgressIndicator()));
    //           }
    //           return const SizedBox(
    //             child: Center(
    //               child: Text(
    //                 "No data",
    //               ),
    //             ),
    //           );
    //         },
    //       ),
    //     ]),

    //     // CommonBurgerShowWidget(imagelist: burgerpopularList,title: ""),
    //     //   CommonBurgerShowWidget(imagelist: burgerpopularList,title: " "),
    //     //      CommonBurgerShowWidget(imagelist: burgerpopularList,title: ""),
    //   ),
    // );
  }
}
