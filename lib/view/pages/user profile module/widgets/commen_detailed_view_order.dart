import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/constants/style.dart';
import 'package:foodies_user/model/Selected_delivery_adress.dart';
import 'package:foodies_user/model/order_tracking_model.dart';
import 'package:foodies_user/view/pages/cart%20module/add_adress_page.dart';
import 'package:foodies_user/view/pages/cart%20module/screen_cart.dart';
import 'package:foodies_user/view/widget/deliveryAdressViewWidget.dart';
import 'package:foodies_user/view/widget/white_app_bar_commen.dart';
import 'package:intl/intl.dart';
import 'package:steps_widget/models/track.dart';
import 'package:steps_widget/tracking_widget.dart';

// ignore: must_be_immutable
class CommenDetailedViewPageOrders extends StatefulWidget {
  int index;
  final OderTrackingDetails data;
  CommenDetailedViewPageOrders(
      {Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  State<CommenDetailedViewPageOrders> createState() =>
      _CommenDetailedViewPageOrdersState();
}

class _CommenDetailedViewPageOrdersState
    extends State<CommenDetailedViewPageOrders> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: whiteCustomAppBar("Order Details"),
      body: SafeArea(
        child: ListView(
          children: [
            StreamBuilder(
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
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      final data = OderTrackingDetails.fromMap(
                          snapshot.data!.docs[widget.index].data());
                      final dat = data.cartData.map((e) => e).toList();
                      return value[index] == false
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TrackingWidget(
                                  direction: Axis.vertical,
                                  itemGap: 35,
                                  color: Colors.grey,
                                  trackList: [
                                    Track(
                                        isActive: !data.orderRejected,
                                        labelText: "Order Pending"),
                                    Track(
                                        isActive: data.orderConfirmed,
                                        labelText: "Order Confirmed"),
                                    Track(
                                        isActive: data.orderPreparing,
                                        labelText: "Order Preparing"),
                                    Track(
                                        isActive: data.orderDelivered,
                                        labelText: "Deliverd"),
                                  ],
                                ),
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: dat.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage:
                                                          NetworkImage(
                                                              dat[index]
                                                                  .image)),
                                                ),
                                                sizeH10,
                                                Expanded(
                                                    child:
                                                        Text(dat[index].name)),
                                                Text(dat[index]
                                                    .price
                                                    .toString()),
                                              ],
                                            ),
                                            Text(
                                                "subTotal : ${dat[index].subTotal!}"),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: kwhite,
                                          border: Border.all(
                                              color: loginColor, width: 0.5),
                                          borderRadius: circle20,
                                        ),
                                        child: ListTile(
                                          title: Text(
                                            "Total amount : ${data.grandTotalAmount / 100}",
                                            style: googleNormalFont,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Card(
                                        elevation: 0,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Order ID : ${data.orderId}",
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Transaction  ID : ${data.paymentTransactionId}",
                                                style: const TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Time: ${DateFormat.jm().format(data.timeOfOrder)}",
                                                style: normalfont15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )
                          : const SizedBox();
                    },
                  );
                }

                return const Text("No data");
              },
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("selected Delivery Adress")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      snapshot) {
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
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold),
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
                                        primary: const Color.fromARGB(
                                            255, 68, 139, 118),
                                        fixedSize: const Size(150, 40),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50))),
                                    onPressed: () async {
                                      adressSelectorWidget();
                                    },
                                    child: const Text("Select Adress")),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: const Color.fromARGB(
                                          255, 68, 139, 118),
                                      fixedSize: const Size(150, 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
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
                        visibleCheck: false,
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
            ),
          ],
        ),
      ),
    );
  }
}
