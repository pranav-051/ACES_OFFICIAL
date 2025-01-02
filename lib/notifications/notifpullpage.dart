import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:aces/firebase_options.dart';
//import 'package:firebase_core/firebase_core.dart';

class notifpullpage extends StatefulWidget {
  const notifpullpage({super.key, required this.title});
  final String title;
  @override
  State<notifpullpage> createState() => _notifpullpageState();
}

class _notifpullpageState extends State<notifpullpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 12, 24, 1),
      appBar: AppBar(
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('notifications')
            .orderBy('timestamp', descending: true)//order notifs by descending dates
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No notifications available',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final notifications = snapshot.data!.docs;

          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              DateTime date = notification['timestamp'].toDate();

              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/notifdetails',
                    arguments: {
                      'title': notification['title'],
                      'description': notification['description'],
                      'name_of_mod': notification['name_of_mod'],
                      'link': notification['link'],
                      'date': date,
                      'imgurl': notification['img_url'],
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromRGBO(3, 14, 58, 0.4),
                  ),
                  child: Row(
                    children: [
                      if (notification['img_url'] != null && notification['img_url'].isNotEmpty)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            notification['img_url'],
                            height: 60, width: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                      const SizedBox(width: 10),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notification['title'],
                            style: const TextStyle(fontSize: 18,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            date.toLocal().toString().split(' ')[0],//formats timestamp to show only the date
                            style: const TextStyle(fontSize: 14,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}