import 'package:flutter/material.dart';
import 'package:foodies_user/view/pages/user%20profile%20module/widgets/userprofileListtile_widget_commen.dart';
import 'package:foodies_user/view/widget/white_app_bar_commen.dart';

class OrderHistoryListViewPage extends StatefulWidget {
  const OrderHistoryListViewPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryListViewPage> createState() => _OrderHistoryListViewPageState();
}

class _OrderHistoryListViewPageState extends State<OrderHistoryListViewPage> {

  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: whiteCustomAppBar("Order History"),
      body: ListView(
        children: [
          UserProfileListTileWidgetCommen(
              widthMedia: widthMedia, heightMedia: heightMedia),
          UserProfileListTileWidgetCommen(
              widthMedia: widthMedia, heightMedia: heightMedia),
          UserProfileListTileWidgetCommen(
              widthMedia: widthMedia, heightMedia: heightMedia)
        ],
      ),
    );
  }
}



