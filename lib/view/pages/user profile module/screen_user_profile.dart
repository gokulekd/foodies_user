import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/constants/style.dart';
import 'package:foodies_user/view/pages/user%20profile%20module/adress/adress_view_page.dart';
import 'package:foodies_user/view/pages/user%20profile%20module/order%20history/order_history_listview_page.dart';
import 'package:foodies_user/view/pages/user%20profile%20module/pending%20orders/pending_orders_detailed_view.dart';
import 'package:foodies_user/view/widget/customer_details_profile.dart';

class ScreenUserProfile extends StatelessWidget {
  const ScreenUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("User Profile", style: googleNormalFont),
        backgroundColor: kwhite,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            sizeH30,
            customerDetailsProfile(heightMedia, widthMedia),
            sizeH30,
            CommenListDetailWidget(
              onTapFUn: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const PendingOrdersDetailedViewPage(),
                    ));
              },
              widthMedia: widthMedia,
              heightMedia: heightMedia,
              title: "Pending Orders",
              subtitle: "See all the Pending Orders",
            ),
            CommenListDetailWidget(
              onTapFUn: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderHistoryListViewPage(),
                    ));
              },
              widthMedia: widthMedia,
              heightMedia: heightMedia,
              title: " Orders History",
              subtitle: "See all the  Orders History",
            ),
            CommenListDetailWidget(
              onTapFUn: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UserProfileAdressViewPage(),
                    ));
              },
              widthMedia: widthMedia,
              heightMedia: heightMedia,
              title: " Adresses",
              subtitle: "See all the  adress",
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CommenListDetailWidget extends StatelessWidget {
  CommenListDetailWidget({
    Key? key,
    required this.widthMedia,
    required this.heightMedia,
    required this.title,
    required this.subtitle,
    required this.onTapFUn,
  }) : super(key: key);

  final double widthMedia;
  final double heightMedia;
  final String title;
  final String subtitle;
  VoidCallback onTapFUn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: widthMedia * 0.9,
        height: heightMedia * 0.15,
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
              padding: const EdgeInsets.only(left: 13.0, top: 13),
              child: Text(
                title,
                style: googleNormalFont,
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.8,
            ),
            InkWell(
              onTap: onTapFUn,
              child: ListTile(
                title: Text(
                  subtitle,
                  style: normalfont15,
                ),
                trailing: const Icon((Icons.arrow_forward_ios_outlined)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
