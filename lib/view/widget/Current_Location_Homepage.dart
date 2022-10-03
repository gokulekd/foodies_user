// ignore: file_names
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';

class CurrentLocation extends StatelessWidget {
  const CurrentLocation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          iconCurrentLocation,
          color: kblack,
        ),
      ),
      title: const Text(
        "Current Location",
        style: TextStyle(color: Color.fromARGB(255, 185, 87, 80)),
      ),
      subtitle: const Text(
        "Kakkanad ,kochi",
        style: TextStyle(color: Color.fromARGB(255, 129, 58, 53)),
      ),
      trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 53, 123, 101),

            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0)),
           
          ),
          onPressed: () {},
          child: const Text("Change"),
          ),
    );
  }
}