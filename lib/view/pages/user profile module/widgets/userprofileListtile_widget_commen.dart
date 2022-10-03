import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/style.dart';
import 'package:foodies_user/model/order_tracking_model.dart';
import 'package:foodies_user/view/pages/user%20profile%20module/widgets/commen_detailed_view_order.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class UserProfileListTileWidgetCommen extends StatelessWidget {
  UserProfileListTileWidgetCommen({
    Key? key,
    required this.widthMedia,
    required this.heightMedia,
    required this.data,
    required this.index,
  }) : super(key: key);

  final double widthMedia;
  final double heightMedia;
  final OderTrackingDetails data;
  int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => CommenDetailedViewPageOrders(index: index, data: data));
        log(index.toString());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: widthMedia * 0.9,
          height: heightMedia * 0.18,
          decoration: BoxDecoration(
              border: Border.all(
                color: loginColor,
                width: 0.8,
              ),
              borderRadius: circle30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13.0, top: 13),
                      child: Text(
                        "Order ID :${data.orderId}",
                        style: googleNormalFont,
                      ),
                    ),
                   
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.8,
              ),
              ListTile(
                leading: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: kred,
                      borderRadius: circle20,
                      image: const DecorationImage(
                          image: AssetImage(
                            burgerNewArrival1,
                          ),
                          fit: BoxFit.cover)),
                ),
                title: Text(
                  DateFormat.jm().format(data.timeOfOrder),
                  style: normalfont15,
                ),
                subtitle: Text("Total amount : ${data.grandTotalAmount / 100}"),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios_outlined)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
