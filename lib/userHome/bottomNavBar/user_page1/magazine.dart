import 'dart:ui' as ui;
import 'package:aces/userHome/bottomNavBar/mainBottomNav.dart';
import 'package:aces/components/text.dart';
import 'package:flutter/material.dart';

class magazine extends StatelessWidget {
  const magazine({Key? key, required String title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool vis = false;
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
            text: "Magazine",
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Colors.black,)
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            child: Column(
              children: [
                CustomText(
                  textAlign: TextAlign.center,
                  text: "ACE THE TECH",
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),

                // Image.asset(
                //   'assets/magazine.jpg',
                //   height: 250,
                //   width: 170,
                //   fit: BoxFit.fill,
                // ),

                Text(
                  textAlign: TextAlign.justify,
                  """
                  
\u00A0 \u00A0From designing, writing an article, collecting insightful thoughts and organizing events...Aces is Proud to Publish their First magazine Ace the Tech. Let's Experience the First Ever Virtual Connect.

\u00A0\u00A0 Ace the Tech is a collection of Amazing Contributions depicting the Creative & Innovative minds of PVGians. It truly displays the real insight by reflecting our dreams, Thoughts, Achievements, Creativity & Imagination.

\u00A0\u00A0 It mainly focuses on Industrial & Nonindustrial Trends. The main objective of this quarterly magazine is to bring out collective efforts from all the teams and showcase their Extraordinary efforts to create unique themes quarterly.""",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
