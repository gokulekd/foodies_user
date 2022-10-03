

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/model/order_tracking_model.dart';
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
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
             
              if (snapshot.hasData && snapshot.data != null) {
                 final value = snapshot.data!.docs
                  .map((e) => e.data()["orderRejected"] == false)
                  .toList();

                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    final data = OderTrackingDetails.fromMap(
                        snapshot.data!.docs[index].data());

                    return value[index] == true
                        ? UserProfileListTileWidgetCommen(
                            data: data,
                            widthMedia: widthMedia,
                            heightMedia: heightMedia,index: index,
                            )
                        : const SizedBox();
                  },
                );
              }

              return const Text("No data");
            }),
      ),
    );
  }
}
