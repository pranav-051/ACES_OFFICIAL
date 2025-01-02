import 'package:aces/SidebarNavPages/mainNavDrawer.dart';
import 'package:aces/components/text.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key, required this.title});
  final String title;
  @override
  State<Page2> createState() => _Page2();
}

class _Page2 extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        drawer: const NavDrawer(),
        appBar:AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Row(
            children: [
              CustomText(
                text: 'Admin Events',
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
             ],
          ),
        ),
        body: ListView(),
    );
  }
  }


