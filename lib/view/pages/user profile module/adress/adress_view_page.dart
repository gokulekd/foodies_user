import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/model/adressmodel.dart';
import 'package:foodies_user/view/pages/user%20profile%20module/adress/all_adress_list_widget.dart';
import 'package:foodies_user/view/widget/white_app_bar_commen.dart';
import 'package:get/get.dart';

class UserProfileAdressViewPage extends StatelessWidget {
  const UserProfileAdressViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: whiteCustomAppBar("Adresses"),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Adress")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection("all Adress")
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              padding: const EdgeInsets.only(top: 10),
              separatorBuilder: (context, index) => sizeH20,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final adress =
                    AdressModel.fromJson(snapshot.data!.docs[index].data());
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 125,
                    width: widthMedia * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: circle20,
                        border: Border.all(color: loginColor, width: 0.9)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ListTile(
                          trailing: IconButton(
                              onPressed: () async {
                                Get.defaultDialog(
                                    title: "Message",
                                    middleText:
                                        "Are You Sure To Delete This Adress ?",
                                    backgroundColor: signupColor,
                                    titleStyle:
                                        const TextStyle(color: Colors.white),
                                    middleTextStyle:
                                        const TextStyle(color: Colors.white),
                                    radius: 30,
                                    actions: [
                                      ElevatedButton.icon(
                                        icon:
                                            const Icon(Icons.backspace_rounded),
                                        style: ElevatedButton.styleFrom(
                                            primary: kgreen,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50))),
                                        onPressed: () async {
                                          final deleteAdress = FirebaseFirestore
                                              .instance
                                              .collection("Adress")
                                              .doc(FirebaseAuth
                                                  .instance.currentUser!.uid)
                                              .collection("all Adress")
                                              .doc(snapshot
                                                  .data!.docs[index].id);
                                          // deleteAdress
                                          //     .delete();

                                          log(">>>>>>>????????${deleteAdress.id}");
                                          final documentID = FirebaseFirestore
                                              .instance
                                              .collection(
                                                  "selected Delivery Adress")
                                              .doc(FirebaseAuth
                                                  .instance.currentUser!.uid)
                                              .snapshots()
                                              .map((event) async {
                                            final value = event["Document Id"];

                                            if (value == deleteAdress.id) {
                                              await FirebaseFirestore.instance
                                                  .collection(
                                                      "selected Delivery Adress")
                                                  .doc(FirebaseAuth.instance
                                                      .currentUser!.uid)
                                                  .delete();
                                            }

                                            return value;
                                          });
                                          log("DocumentiDDDDDDD ${documentID.toString()}");
                                          Get.back();
                                        },
                                        label: const Text("cancel"),
                                      ),
                                      ElevatedButton.icon(
                                        icon: const Icon(Icons.remove_circle),
                                        style: ElevatedButton.styleFrom(
                                            primary: kred,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(50))),
                                        onPressed: () async {
                                          final deleteAdress = FirebaseFirestore
                                              .instance
                                              .collection("Adress")
                                              .doc(FirebaseAuth
                                                  .instance.currentUser!.uid)
                                              .collection("all Adress")
                                              .doc(snapshot
                                                  .data!.docs[index].id);
                                          await deleteAdress
                                              .delete()
                                              .then((value) async {
                                            log(">>>>>>>????????${deleteAdress.id}");

                                            final documentID =
                                                await FirebaseFirestore.instance
                                                    .collection(
                                                        "selected Delivery Adress")
                                                    .doc(FirebaseAuth.instance
                                                        .currentUser!.uid)
                                                    .get();

                                            Map<String, dynamic> data =
                                                documentID.data()
                                                    as Map<String, dynamic>;
                                            if (data["Document Id"] ==
                                                deleteAdress.id) {
                                              await FirebaseFirestore.instance
                                                  .collection(
                                                      "selected Delivery Adress")
                                                  .doc(FirebaseAuth.instance
                                                      .currentUser!.uid)
                                                  .delete();
                                            }

                                            log(">>>>>>>${data["Document Id"]}");
                                          });

                                          Get.snackbar(
                                              "Message", "deleted Adress",
                                              backgroundColor: kgreen,
                                              colorText: kwhite);
                                          Get.back();
                                        },
                                        label: const Text("yes"),
                                      ),
                                    ]);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: kred,
                              )),
                          leading: adressTypeHome(),
                          title: Text(
                            adress.name.toString(),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(adress.houseName),
                              Text("${adress.areaNo},${adress.landMark}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: SizedBox(
                height: 50,
                child: Center(child: Text("No Adress Found")),
              ),
            );
          }
          return const Center(
            child: SizedBox(
              height: 50,
              child: Center(child: Text("No Adress Found")),
            ),
          );
        },
      ),
    );
  }
}
