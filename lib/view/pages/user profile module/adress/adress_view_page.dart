import 'package:flutter/material.dart';
import 'package:foodies_user/constants/border_radious.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/sized_box.dart';
import 'package:foodies_user/view/pages/user%20profile%20module/adress/all_adress_list_widget.dart';
import 'package:foodies_user/view/widget/white_app_bar_commen.dart';

class UserProfileAdressViewPage extends StatelessWidget {
  const UserProfileAdressViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthMedia = MediaQuery.of(context).size.width;
    double heightMedia = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: whiteCustomAppBar("Adresses"),
      body: ListView.separated(
        padding: const EdgeInsets.only(top: 10),
        separatorBuilder: (context, index) => sizeH10,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              width: widthMedia * 0.9,
              decoration: BoxDecoration(
                  borderRadius: circle20,
                  border: Border.all(color: loginColor, width: 0.9)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ListTile(
                    leading: adressTypWork(),
                    title: const Text(
                      "Home",
                    ),
                    subtitle: const Text(
                        "Gokulam House,ennakad po,chengannur -689624,alappuzha,kerala"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(Icons.edit),
                        style: ElevatedButton.styleFrom(
                            primary: loginColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const CheckOutPage(),
                          //     ));
                        },
                        label: const Text("Edit"),
                      ),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.delete),
                        style: ElevatedButton.styleFrom(
                            primary: kred,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50))),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const CheckOutPage(),
                          //     ));
                        },
                        label: const Text("delete"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
