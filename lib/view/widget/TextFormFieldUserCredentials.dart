
import 'package:flutter/material.dart';
import 'package:foodies_user/constants/colors.dart';

// ignore: must_be_immutable
class TextFormFieldUserCredentials extends StatelessWidget {
  TextEditingController controller;
  String fieldTitle;
  IconData prefixIconName;
  bool obscure;
  IconData? sufixiconName;
  
  TextFormFieldUserCredentials({
    Key? key,
    required this.fieldTitle,
    required this.prefixIconName,
    this.sufixiconName,
    required this.controller,
    required this.obscure
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 45,
        width: 350,
        child: TextFormField(
          controller: controller,
          obscureText: obscure,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  prefixIconName,
                  color: textformFieldIconcolor,
                ),
                 suffixIcon: Icon(
                  sufixiconName,
                  color: textformFieldIconcolor,
                ),
                labelText: fieldTitle,
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
