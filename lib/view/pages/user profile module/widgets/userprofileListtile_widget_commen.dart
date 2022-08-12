import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/style.dart';

class UserProfileListTileWidgetCommen extends StatelessWidget {
  const UserProfileListTileWidgetCommen({
    Key? key,
    required this.widthMedia,
    required this.heightMedia,
  }) : super(key: key);

  final double widthMedia;
  final double heightMedia;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      "Order ID :45897",
                      style: googleNormalFont,
                    ),
                  ),
                  orderStatusPending(),
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
                "Total item : 2",
                style: normalfont15,
              ),
              subtitle: const Text("Total amount : 897"),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_forward_ios_outlined)),
            )
          ],
        ),
      ),
    );
  }
}

Padding orderStatusPreparing() {
  return Padding(
    padding: const EdgeInsets.only(top: 13, right: 2),
    child: Container(
      padding: const EdgeInsets.only(top: 2),
      decoration: BoxDecoration(borderRadius: circle10, color: Color.fromARGB(255, 158, 175, 76)),
      height: 20,
      width: 100,
      child: const Text(
        "Preparing",
        textAlign: TextAlign.center,
        style: TextStyle(color: kwhite),
      ),
    ),
  );
}

Padding orderStatusPending() {
  return Padding(
    padding: const EdgeInsets.only(top: 13, right: 2),
    child: Container(
      padding: const EdgeInsets.only(top: 2),
      decoration: BoxDecoration(borderRadius: circle10, color: Color.fromARGB(255, 175, 114, 76)),
      height: 20,
      width: 100,
      child: const Text(
        "Pending",
        textAlign: TextAlign.center,
        style: TextStyle(color: kwhite),
      ),
    ),
  );
}

Padding orderStatusConfirmed() {
  return Padding(
    padding: const EdgeInsets.only(top: 13, right: 2),
    child: Container(
      padding: const EdgeInsets.only(top: 2),
      decoration: BoxDecoration(borderRadius: circle10, color: Color.fromARGB(255, 71, 151, 151)),
      height: 20,
      width: 100,
      child: const Text(
        "Confimed",
        textAlign: TextAlign.center,
        style: TextStyle(color: kwhite),
      ),
    ),
  );
}

Padding orderStatusDeliverd() {
  return Padding(
    padding: const EdgeInsets.only(top: 13, right: 2),
    child: Container(
      padding: const EdgeInsets.only(top: 2),
      decoration: BoxDecoration(borderRadius: circle10, color: Colors.green),
      height: 20,
      width: 100,
      child: const Text(
        "Delived",
        textAlign: TextAlign.center,
        style: TextStyle(color: kwhite),
      ),
    ),
  );
}


Padding orderStatusCancelled() {
  return Padding(
    padding: const EdgeInsets.only(top: 13, right: 2),
    child: Container(
      padding: const EdgeInsets.only(top: 2),
      decoration: BoxDecoration(borderRadius: circle10, color: Color.fromARGB(255, 168, 65, 59)),
      height: 20,
      width: 100,
      child: const Text(
        "Cancelled",
        textAlign: TextAlign.center,
        style: TextStyle(color: kwhite),
      ),
    ),
  );
}

