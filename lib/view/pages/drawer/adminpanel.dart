// import 'package:flutter/material.dart';
// import 'package:foodies_user/constants/colors.dart';
// import 'package:foodies_user/constants/style.dart';

// import 'package:google_fonts/google_fonts.dart';

// class AdminPanel extends StatelessWidget {
//   const AdminPanel({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const SizedBox(),
//         backgroundColor: kwhite,
//         title: Text(
//           "Admin Panel",
//           style: googleNormalFont,
//         ),
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: ListView(
//           children: [
//             SizedBox(
//               height: 120,
//               width: 120,
//               child: Image.asset(foodiesLogoImage),
//               // color: kred,
//             ),
//             Center(
//               child: Text("Burger",
//                   style:
//                       GoogleFonts.fredokaOne(fontSize: 40, color: loginColor)),
//             ),
//             sizeH20,
//             adminPanelListTile(
//                 name: "User Mangement",
//                 iconname: userManagemetIcon,
//                 onPressed: () => selectedItemNavigation(context, 1)),
//             adminPanelListTile(
//                 name: "Product Mangement",
//                 iconname: productManagemetIcon,
//                 onPressed: () => selectedItemNavigation(context, 2)),
//             adminPanelListTile(
//                 name: " Statitics and Earnings",
//                 iconname: statiticAndEarningsIcon,
//                 onPressed: () => selectedItemNavigation(context, 3)),
//             adminPanelListTile(
//                 name: "Offer management",
//                 iconname: offerManagementIcon,
//                 onPressed: () => selectedItemNavigation(context, 4)),
//             adminPanelListTile(
//                 name: "Category Management",
//                 iconname: categoryManagementIcon,
//                 onPressed: () => selectedItemNavigation(context, 5)),
//                  adminPanelListTile(
//                 name: "Coupen Management",
//                 iconname: coupenManagementIcon,
//                 onPressed: () => selectedItemNavigation(context, 6)),
//                  adminPanelListTile(
//                 name: "Admin  Profile",
//                 iconname: adminProfileManagementIcon,
//                 onPressed: () => selectedItemNavigation(context, 7)),
//           ],
//         ),
//       ),
//     );
//   }

//   Padding adminPanelListTile(
//       {required String name,
//       required IconData iconname,
//       VoidCallback? onPressed}) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: circle10,
//             border: Border.all(color: loginColor, width: 0.5),
//             color: kbargoundColor),
//         child: ListTile(
//           leading: Icon(iconname),
//           title: Text(name),
//           onTap: onPressed,
//         ),
//       ),
//     );
//   }
// }

// selectedItemNavigation(BuildContext context, int index) {
//   switch (index) {
//     case 1:
//       Navigator.push(context,
//           MaterialPageRoute(builder: (_) => const UserManagementPage()));
//       break;
//     case 2:
//       Navigator.push(context,
//           MaterialPageRoute(builder: (_) => const ProductListViewPage()));
//       break;
//     case 3:
//       Navigator.push(context,
//           MaterialPageRoute(builder: (_) => const StatiticsManagementPage()));
//       break;
//     case 4:
//       Navigator.push(context,
//           MaterialPageRoute(builder: (_) => const OfferManagementPage()));
//       break;
//     case 5:
//       Navigator.push(context,
//           MaterialPageRoute(builder: (_) => const CategoryManagementPage()));
//       break;
//        case 6:
//       Navigator.push(context,
//           MaterialPageRoute(builder: (_) => const CoupenManagementPage()));
//       break;
//        case 7:
//       Navigator.push(context,
//           MaterialPageRoute(builder: (_) => const AdminProfilePage()));
//       break;
//   }
// }
