// ignore: file_names
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';
import 'package:foodies_user/constants/icons.dart';


class SearchBar extends StatelessWidget {

  const SearchBar({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 45,
        width: 350,
        child: TextFormField(
            decoration: InputDecoration(
              fillColor: kblack,
              
                 suffixIcon: Icon(
                  iconSearch,
                  color: textformFieldIconcolor,
                ),
                labelText: "Search",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: textformfieldBorder,
                    width: 1.5,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: textformfieldBorder,
                    width: 0.5,
                  ),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20))),
      ),
    );
  }
}
