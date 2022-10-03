import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/constants/style.dart';
import 'package:foodies_user/controller/cart_controller.dart';
import 'package:foodies_user/model/Selected_delivery_adress.dart';
import 'package:foodies_user/model/add_to_cart.dart';
import 'package:foodies_user/model/adressmodel.dart';
import 'package:foodies_user/view/pages/cart%20module/CheckOutPage.dart';
import 'package:foodies_user/view/pages/cart%20module/add_adress_page.dart';
import 'package:foodies_user/view/pages/cart%20module/update_adress_page.dart';
import 'package:foodies_user/view/pages/cart%20module/widgets/products_in_cart_widget.dart';
import 'package:foodies_user/view/widget/white_app_bar_commen.dart';
import 'package:get/get.dart';
import '../../widget/deliveryAdressViewWidget.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthMedia = MediaQuery.of(context).size.width;
    var heightMedia = MediaQuery.of(context).size.height;
    final controller = Get.put(CartController());

    return Scaffold(
      backgroundColor: kbargoundColor,
     appBar: whiteCustomAppBar("Cart"),
      body: SafeArea(
        child: ListView(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("User cart")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection("cart Item")
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => sizeH10,
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ProductsInCartWidget(
                        controller: controller,
                        product: AddtoCart.fromMap(
                            snapshot.data!.docs[index].data()),
                      );
                    },
                  );
                }
                return const SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: Center(
                    child: Text("No items in the cart"),
                  ),
                );
              },
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Container(
                    height: 160,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: circle30,
                    ),
                    child: ClipRRect(
                      borderRadius: circle30,
                      child: Image.asset(
                        burgerOffer3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SelectedDeliveryAdressWidget(
                heightMedia: heightMedia, widthMedia: widthMedia),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("User cart")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection("cart Item")
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasData) {
                  int grandTotal = 0;
                  for (var i = 0; i < snapshot.data!.docs.length; i++) {
                    grandTotal =
                        snapshot.data!.docs[i]["subTotal"] + grandTotal;
                  }
                  return grandTotal != 0
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: kwhite,
                              border: Border.all(color: loginColor, width: 0.5),
                              borderRadius: circle20,
                            ),
                            child: ListTile(
                                title: Text(
                                  "Total amount : $grandTotal",
                                  style: googleNormalFont,
                                ),
                                trailing: CheckOutPage(
                                    amount: grandTotal.toDouble() * 100)),
                          ),
                        )
                      : const SizedBox();
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SelectedDeliveryAdressWidget extends StatelessWidget {
  const SelectedDeliveryAdressWidget({
    Key? key,
    required this.heightMedia,
    required this.widthMedia,
  }) : super(key: key);

  final double heightMedia;
  final double widthMedia;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("selected Delivery Adress")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data?.data() == null) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: heightMedia * 0.2,
                width: widthMedia * 0.95,
                decoration: BoxDecoration(
                    borderRadius: circle30,
                    color: kwhite,
                    border: Border.all(color: Colors.grey)),
                child: Column(
                  children: [
                    sizeH20,
                    const Text(
                      "You are in a new location",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    sizeH10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary:
                                    const Color.fromARGB(255, 68, 139, 118),
                                fixedSize: const Size(150, 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50))),
                            onPressed: () async {
                              adressSelectorWidget();
                            },
                            child: const Text("Select Adress")),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 68, 139, 118),
                              fixedSize: const Size(150, 40),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddAdressPage(),
                                ));
                          },
                          child: const Text("Add Adress"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          } else {
            return deliveryAdressViewWidget(
                visibleCheck: true,
                heightMedia,
                widthMedia,
                context,
                SelectedDeliveryAdress.fromJson(snapshot.data!.data()));
          }
        } else {
          return const SizedBox(
            height: 50,
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}

adressSelectorWidget() {
  return Get.bottomSheet(
    Column(
      children: [
        Row(
          children: [
            sizeH10,
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: Text("Choose Your Adress",
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 25),
              child: ElevatedButton.icon(
                label: const Text("Add New adress"),
                icon: const Icon(Icons.add_circle_outline_outlined),
                style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 68, 139, 118),
                    fixedSize: const Size(160, 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () {
                  Get.to(() => AddAdressPage());
                },
              ),
            ),
          ],
        ),
        const Divider(
          color: kblack,
          thickness: 0.5,
        ),
        Expanded(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Adress")
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection("all Adress")
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: SizedBox(
                  height: 50,
                  child: Text("No Address Found "),
                ));
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final data =
                      AdressModel.fromJson(snapshot.data!.docs[index].data());
                  return InkWell(
                    onTap: () async {
                      log("selcted adress>>>>>>>Index >>>>>>>${snapshot.data!.docs[index].id}");

                      await FirebaseFirestore.instance
                          .collection("selected Delivery Adress")
                          .doc(FirebaseAuth.instance.currentUser!.uid)
                          .set({
                        "name": data.name,
                        "mobile": data.mobile,
                        "houseName": data.houseName,
                        "areaNo": data.areaNo,
                        "landMark": data.landMark,
                        "Document Id": snapshot.data!.docs[index].id.toString()
                      });
                      Get.back();
                    },
                    child: ListTile(
                      leading: Icon(iconHome),
                      title: Text(data.houseName.toString()),
                      subtitle: Text("${data.areaNo},${data.landMark}"),
                      trailing: IconButton(
                        icon: Icon(iconedit),
                        onPressed: (() => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateAdressPage(),
                              ),
                            )),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
    ),
  );
}
