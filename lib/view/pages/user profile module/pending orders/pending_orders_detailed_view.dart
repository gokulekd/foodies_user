import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/view/pages/user%20profile%20module/widgets/userprofileListtile_widget_commen.dart';
import 'package:foodies_user/view/widget/white_app_bar_commen.dart';

class PendingOrdersDetailedViewPage extends StatelessWidget {
  const PendingOrdersDetailedViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: whiteCustomAppBar("Pending Orders"),
      body: SafeArea(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("order Tracking")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection("data")
                .snapshots()
                .map((event) => event.docs.map((e) => e.data())),
            builder: (context,
                AsyncSnapshot<Iterable<Map<String, dynamic>>> snapshot) {

         //        final value =  snapshot.data!.where((element) => element.)
              // if (snapshot.hasData && snapshot.data != null) {
              //   final data = snapshot.data!.docs
              //       .map((e) => e.data()["order rejected"])
              //       .any((element) => element);
              //       final dataLenght = snapshot.data!.docs.map((e) => e.data()["order rejected"] == false).length;
              if (snapshot.hasData) {
                final data = snapshot.data!
                    .map((e) => e.containsKey("order rejected"))
                    .toList();
                    log(data.length.toString());
                if (data.contains(true)) {
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return UserProfileListTileWidgetCommen(
                          widthMedia: widthMedia, heightMedia: heightMedia);
                    },
                  );
                }
              }

              return const Text("No data");
            }),
      ),
    );
  }
}
