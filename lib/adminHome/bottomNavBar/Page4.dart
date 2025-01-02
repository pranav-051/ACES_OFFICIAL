import 'package:aces/SidebarNavPages/mainNavDrawer.dart';
import 'package:aces/components/text.dart';
import 'package:aces/components/textField.dart';
import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  const Page4({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Page4> createState() => _Page4();
}

class _Page4 extends State<Page4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(
            color: Colors.black),
        title: const Row(
          children: [
            CustomText(
              text: 'Admin About ACES',
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ])),
      body: Center(
      child: CustomTextField(controller: TextEditingController(), hintText: "Pratik", labelText: "Pratik", icon: Icons.import_contacts_rounded),
    ));
  }
}
