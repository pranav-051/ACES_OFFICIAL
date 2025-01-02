import 'dart:ui' as ui;
import 'package:aces/userHome/bottomNavBar/mainBottomNav.dart';
import 'package:aces/components/text.dart';
import 'package:flutter/material.dart';

class membership_qr extends StatelessWidget {
  const membership_qr({Key? key, required String title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const mainBottomNav(title: "MAIN BOTTOM NAV")),
              );
            },
          ),
          title: const CustomText(
            text: "Digital ID",
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,)
      ),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CustomText(text: "Under Development")
      ),
    );
  }
}
