import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginSignupButton extends StatelessWidget {
  VoidCallback onPressedFunction;
  final Color buttonColor;
  final String iconText;
   LoginSignupButton({
    Key? key,
    required this.onPressedFunction,
    required this.buttonColor,
    required this.iconText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
       style: ElevatedButton.styleFrom(
         primary: buttonColor,
             
         elevation: 3,
         shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(32.0)),
             minimumSize: const Size(350, 40),
       ),
              
       onPressed: onPressedFunction,
       child:  Text(iconText,style: const TextStyle(fontSize: 20),),
              ),
    );
  }
}