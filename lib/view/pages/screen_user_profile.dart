import 'package:flutter/material.dart';

class ScreenUserProfile extends StatelessWidget {
  const ScreenUserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SafeArea(child: Center(
        child: Text("UserProfile"),
      )
      ),
    );
  }
}