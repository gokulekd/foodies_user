import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

signupLoginRichText(String firstText,String secondText,VoidCallback onpressed){
   return RichText(
          text: TextSpan(
            text: firstText,
              style: const TextStyle(
                color: Colors.black, fontSize: 18),
                children: <TextSpan>[
                 TextSpan(text:secondText,
                    style: const TextStyle(
                      color: Colors.blueAccent, fontSize: 18 ),
                      recognizer: TapGestureRecognizer()
                       ..onTap = onpressed
              )
            ]
        ),
      ); 
}

