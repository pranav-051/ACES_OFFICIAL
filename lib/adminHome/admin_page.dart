import 'package:aces/SidebarNavPages/main_left_panel.dart';
import 'package:aces/adminHome/update_leaderboard.dart';
import 'package:aces/components/custom_button.dart';
import 'package:aces/constants/colors.dart';
import 'package:flutter/material.dart';

import '../components/text.dart';

class adminPage extends StatefulWidget {
  const adminPage({super.key, required this.title});
  final String title;
  @override
  State<adminPage> createState() => _adminPage();
}

class _adminPage extends State<adminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar( backgroundColor: AppColors.scarletRed,
        iconTheme: const IconThemeData(size: 30),
        title: const Row(
          children: [
            CustomText(
              text: 'Admin Home',
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const uploadLeaderboard(title: 'uploadLeaderboard',),
                    ),
                  );
                },
                text: "Upload images / videos for past Event Gallery ",
                width: 320,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
