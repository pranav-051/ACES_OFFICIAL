import 'package:aces/auth_users/loginPage.dart';
import 'package:aces/adminHome/admin_bottom_nav.dart';
import 'package:aces/components/button.dart';
import 'package:aces/constants/colors.dart';
import 'package:aces/userHome/bottomNavBar/mainBottomNav.dart';
import 'package:aces/auth_users/registerPage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, this.title});
  final String? title;

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Widget _slider() {
    return CarouselSlider(
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
      ],
      options: CarouselOptions(
        height: 450,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 15,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 100),
        viewportFraction: 1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:  AppColors.lightGray,
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height:100,),
                  _slider(),

              const Divider(),
                  const SizedBox(height: 40),
                  CustomButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const LoginScreen ()));
                  }, text: "Login Now", width: 280, ),

                  const SizedBox(height: 20),
                  CustomButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterScreen()));
                  }, text: "Register Now", width: 280, ),

          const SizedBox(height: 130),
                  CustomButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const mainBottomNav(title: "User Pages")));
                  }, text: "User Backdoor", width: 280, ),
                  const SizedBox(height:30),

                  CustomButton(onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  const admin_bottom_nav(title: "Admin pages",)));
                    },
                    text: "Admin Backdoor",
                    width: 280,
                  ),
                  const SizedBox(height:30),
                ],
              ),
            ]),
          ),
        ));
  }
}
