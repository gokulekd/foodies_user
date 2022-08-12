import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';
import 'package:foodies_user/constants/images.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/constants/style.dart';
import 'package:foodies_user/view/pages/cart%20module/CheckOutPage.dart';
import 'package:foodies_user/view/pages/cart%20module/add_adress_page.dart';
import 'package:foodies_user/view/pages/cart%20module/update_adress_page.dart';
import 'package:foodies_user/view/widget/CartPage_food_widget.dart';
import 'package:foodies_user/view/widget/deliveryAdressViewWidget.dart';
import 'package:foodies_user/view/widget/order_billing_splitup_widget.dart';

class ScreenCart extends StatelessWidget {
  const ScreenCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var widthMedia = MediaQuery.of(context).size.width;
    var heightMedia = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: KbargoundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: ListView.separated(
                  separatorBuilder: (context, index) => sizeH10,
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CartPageFoodDetails(
                        height: heightMedia, width: widthMedia);
                  },
                ),
              ),
            ),
            Padding(
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
            orderBillingSplitup(heightMedia, widthMedia),
            Padding(
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
                            onPressed: () {
                              adressSelectorWidget(context);
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
                                  builder: (context) => const AddAdressPage(),
                                ));
                          },
                          child: const Text("Add Adress"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            deliveryAdressViewWidget(heightMedia, widthMedia, context),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: kwhite,
                  border: Border.all(color: loginColor, width: 0.5),
                  borderRadius: circle20,
                ),
                child: ListTile(
                  title: Text(
                    "Total amount : 349",
                    style: googleNormalFont,
                  ),
                  subtitle: Text(
                    "total items : 3",
                    style: googlefontBlackFont15,
                  ),
                  trailing: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 48, 116, 46),
                        fixedSize: const Size(150, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CheckOutPage(),
                          ));
                    },
                    child: const Text("Proceed to pay"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void adressSelectorWidget(context) {
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      ),
    ),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    context: context,
    builder: (builder) {
      return Container(
        height: 350.0,
        color: Colors.black26,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0))),
          child: ListView(
            children: [
              Row(
                children: [
                  sizeH10,
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text("Choose Your Adress",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold)),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddAdressPage(),
                            ));
                      },
                    ),
                  ),
                ],
              ),
              sizeH10,
              const Divider(
                thickness: 1,
              ),
              sizeH20,
              ListTile(
                leading: Icon(iconHome),
                title: const Text("Home"),
                subtitle: const Text("Gokulam House,ennakad po,chengannur"),
                trailing: IconButton(
                  icon: Icon(iconedit),
                  onPressed: (() => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateAdressPage(),
                        ),
                      )),
                ),
              ),
              sizeH20,
              ListTile(
                leading: const Icon(Icons.work_outline_outlined),
                title: const Text("Work"),
                subtitle: const Text("Gokulam House,ennakad po,chengannur"),
                trailing: IconButton(
                  icon: Icon(iconedit),
                  onPressed: (() => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UpdateAdressPage(),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
