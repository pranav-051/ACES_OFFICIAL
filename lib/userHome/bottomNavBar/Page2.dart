import 'package:aces/SidebarNavPages/mainNavDrawer.dart';
import 'package:aces/components/event_card.dart';
import 'package:aces/components/text.dart';
import 'package:aces/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.title});
  final String title;

  final List<Map<String, String>> events = const [
    {
      "image": "assets/event1.png",
      "name": "Tech Conference 2024",
      "description": "An insightful conference for tech enthusiasts.",
      "date": "2024-02-15",
      "time": "10:00 AM",
      "mode": "Online",
      "formLink": "https://example.com/form1"
    },
    {
      "image": "assets/event2.png",
      "name": "Hackathon 2024",
      "description": "Showcase your coding skills in a 24-hour challenge.",
      "date": "2024-03-10",
      "time": "9:00 AM",
      "mode": "Offline",
      "formLink": "https://example.com/form2"
    },
    {
      "image": "assets/event3.png",
      "name": "AI Workshop",
      "description": "Hands-on workshop on Artificial Intelligence.",
      "date": "2024-04-05",
      "time": "11:00 AM",
      "mode": "Online",
      "formLink": "https://example.com/form3"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: const NavDrawer(),
          appBar: AppBar(
            backgroundColor: AppColors.lightGray2,
            iconTheme: const IconThemeData(color: Colors.black, size: 30),
            title: const Row(
              children: [
                CustomText(
                  text: 'Events',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ],
            ),
            bottom: const TabBar(
              indicatorColor: AppColors.oxfordBlue,
              tabs: [
                Tab(
                  icon: Icon(Icons.code),
                  text: 'Tech Events',
                ),
                Tab(
                  icon: Icon(Icons.code_off),
                  text: 'Non-Tech Events',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Tech Events
              ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return EventCard(
                    image: event["image"]!,
                    name: event["name"]!,
                    description: event["description"]!,
                    date: event["date"]!,
                    time: event["time"]!,
                    mode: event["mode"]!,
                    onRegister: () async {
                      final formLink = event["formLink"];
                      if (formLink != null) {
                        // Disable button temporarily
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Opening registration form for ${event["name"]!}')),
                        );

                        try {
                          if (await canLaunchUrl(Uri.parse(formLink))) {
                            await launchUrl(
                              Uri.parse(formLink),
                              mode: LaunchMode.inAppWebView,
                            );
                          } else {
                            throw 'Could not launch $formLink';
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: $e')),
                          );
                        }
                      }
                    }, formLink: 'https://docs.google.com/forms/d/e/1FAIpQLSddCTSL5zr3NRVN68qxq4sggeEkPj5y6QYINu6iYMWpOnZmfg/viewform?usp=header',
                  );
                },
              ),

              // Non-Tech Events
              ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final event = events[index];
                  return EventCard(
                    image: event["image"]!,
                    name: event["name"]!,
                    description: event["description"]!,
                    date: event["date"]!,
                    time: event["time"]!,
                    mode: event["mode"]!,
                    onRegister: () async {
                      final formLink = event["formLink"];
                      if (formLink != null) {
                        // Disable button temporarily
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Opening registration form for ${event["name"]!}')),
                        );

                        try {
                          if (await canLaunchUrl(Uri.parse(formLink))) {
                            await launchUrl(
                              Uri.parse(formLink),
                              mode: LaunchMode.inAppWebView,
                            );
                          } else {
                            throw 'Could not launch $formLink';
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error: $e')),
                          );
                        }
                      }
                    }, formLink: 'https://docs.google.com/forms/d/e/1FAIpQLSddCTSL5zr3NRVN68qxq4sggeEkPj5y6QYINu6iYMWpOnZmfg/viewform?usp=header',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
