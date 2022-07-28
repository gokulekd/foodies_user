
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';

// ignore: must_be_immutable
class CategoryTitle extends StatelessWidget {
  String title ;
  IconData iconName;

   CategoryTitle({
    Key? key,
    required this.title,
    required this.iconName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          iconName,
          color:kred,
        ),
      ),
      title:  Text(
        title,
        style: const TextStyle(color: Color.fromARGB(255, 185, 87, 80)),
      ),
     
      trailing: InkWell(
        onTap: () {
          
        },
        child: const Text("See More>>",style: TextStyle(color:loginColor,),))
    );
  }
}