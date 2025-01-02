import 'package:aces/userHome/bottomNavBar/page1.dart';
import 'package:aces/components/text.dart';
import 'package:flutter/material.dart';

class year_calender extends StatelessWidget {
  const year_calender({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Page1(title: "Page 1")),
            );
          },
        ),
        title: const CustomText(text: "Year Calendar",  fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: Colors.black,),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Calendar Image 1
              Image.asset(
                'assets/past_event_gallery/img2.jpeg',
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              // Calendar Image 2 (optional for multiple calendars)
              Image.asset(
                'assets/past_event_gallery/img6.jpeg',
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 16),
              // Add more calendar images as needed
            ],
          ),
        ),
      ),
    );
  }
}
