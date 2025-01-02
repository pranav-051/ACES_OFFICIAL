import 'package:aces/SidebarNavPages/mainNavDrawer.dart';
import 'package:aces/components/button.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../components/text.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key, required this.title});
  final String title;
  @override
  State<Page1> createState() => _Page1();
}

class _Page1 extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        title: const Row(
          children: [
            CustomText(
              text: 'Admin Home',
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CarouselSlider(
                  items: [
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/imag1.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/imag2.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/imag3.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: const DecorationImage(
                          image: AssetImage("assets/imag2.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 180,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration:
                    const Duration(milliseconds: 600),
                    viewportFraction: 1,
                  )),

              Divider(),

              const SizedBox(
                height: 10,
              ),

              CustomButton(onPressed: () {print("pressed");}, text: "Upload images / videos for past Event Gallery ", width: 320, backgroundColor: Colors.blue,textColor: Colors.white, ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align buttons evenly
                    children: [
                      CustomButton(onPressed: () {print("pressed");}, text: "Year Calender", width: 100, ),
                      CustomButton(onPressed: () {print("pressed");}, text: "Notifications", width: 100, backgroundColor: Colors.black,textColor: Colors.white,),
                      CustomButton(onPressed: () {print("pressed");}, text: "btn", width: 100, backgroundColor: Colors.orange,textColor: Colors.white, ),
                    ],
                  ),
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align buttons evenly
                    children: [
                      CustomButton(onPressed: () {print("pressed");}, text: "XX XXXX XXX XXXXXXX", width: 155,),
                    ],
                  ),
                ),
              ),

              Center(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align buttons evenly
                    children: [
                      CustomButton(onPressed: () {print("pressed");}, text: "XXXXXX XXX", width: 100,  backgroundColor: Colors.green,textColor: Colors.black, ),
                      CustomButton(onPressed: () {print("pressed");}, text: "XXX XXXXXX", width: 100, backgroundColor: Colors.pink,textColor: Colors.black,),
                      CustomButton(onPressed: () {print("pressed");}, text: "XX XX XXXX", width: 100, backgroundColor: Colors.yellow,textColor: Colors.black, ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 400,),
            ],
          ),
        ),
      ),
    );
  }
}
