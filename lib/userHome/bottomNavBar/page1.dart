import 'package:aces/SidebarNavPages/mainNavDrawer.dart';
import 'package:aces/components/button.dart';
import 'package:aces/components/button_multiline.dart';
import 'package:aces/userHome/bottomNavBar/user_page1/membership_qr.dart';
import 'package:aces/userHome/bottomNavBar/user_page1/year_calendar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:aces/userHome/bottomNavBar/user_page1/event_gallery.dart';
import '../../components/text.dart';
import 'package:url_launcher/url_launcher.dart';

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
              text: 'Home',
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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

                const Divider(),

                const SizedBox(
                  height: 10,
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10,10,10,10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align buttons evenly
                      children: [
                        CustomButton(onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                              //builder: (_) => const UserScreenA(),
                              builder: (_) => const year_calender(),
                          ),
                          );
                        }, text: "Year Calender", width: 100, ),
                        CustomButton(onPressed: () {}, text: "Notifications", width: 100, backgroundColor: Colors.black,textColor: Colors.white,),
                        CustomButton(onPressed: () {}, text: "Chat with me", width: 100, backgroundColor: Colors.orange,textColor: Colors.white, ),
                      ],
                    ),
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10,10,10,10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align buttons evenly
                      children: [
                        CustomButton(onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              //builder: (_) => const UserScreenA(),
                                builder: (_) => const event_gallery(),
                            ),
                          );
                        }, text: "Past Event Gallery", width: 155, backgroundColor: Colors.blue,textColor: Colors.black, ),
                        CustomButton(onPressed: () {}, text: "XXXXXXXXXXXXXX ", width: 200,),
                      ],
                    ),
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10,10,10,10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align buttons evenly
                      children: [
                        CustomButton(onPressed: () {
                              launchURL("https://acespvgcoet.in/");
                            },
                        text: "Visit our website", width: 140,  backgroundColor: Colors.green,textColor: Colors.black, ),
                        CustomButton(onPressed: () {}, text: "XXXXXX", width: 80, backgroundColor: Colors.pink,textColor: Colors.black,),
                        CustomButton(onPressed: () {}, text: "XX XXXX", width: 80, backgroundColor: Colors.yellow,textColor: Colors.black, ),
                      ],
                    ),
                  ),
                ),

                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5,5,5,5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Align buttons evenly
                      children: [
                        CustomMultilineButton(onPressed: (){
                          launchURL("https://docs.google.com/forms/d/e/1FAIpQLSddCTSL5zr3NRVN68qxq4sggeEkPj5y6QYINu6iYMWpOnZmfg/viewform?usp=header");
                        }, text1: "Be a part of", text2: "ACES family", width: 165),
                        CustomMultilineButton(onPressed: (){
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                              //builder: (_) => const UserScreenA(),
                              builder: (_) => const membership_qr(title: "QR"),
                          ),);
                        }, text1: "Your Digital" , text2: "membership QR code", width: 165,),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 400,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> launchURL(String url) async {
  final Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    await launchUrl(
      uri,
     // mode: LaunchMode.inAppWebView, // Opens the URL in an in-app browser
    );
  } else {
    throw 'Could not launch $url';
  }
}
