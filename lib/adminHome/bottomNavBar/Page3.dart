import 'package:aces/SidebarNavPages/mainNavDrawer.dart';
import 'package:aces/components/text.dart';
import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key, required this.title});
  final String title;
  @override
  State<Page3> createState() => _Page3();
}

class _Page3 extends State<Page3> {
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
                text: 'Admin Leader Board',
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ],
          ),
        ),
        body: ListView()
    );
  }
}
