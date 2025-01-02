import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:aces/firebase_options.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:url_launcher/url_launcher.dart';
class notifdeetspage extends StatelessWidget{
  final String title;
  final String description;
  final String name_of_mod;
  final String link;
  final DateTime date;
  final String imgurl;
  notifdeetspage({required this.name_of_mod, required this.title, required this.description, required this.link, required this.date, required this.imgurl});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url); //parse the url
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
    else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(1, 12, 24, 1),
      appBar: AppBar(
        title: Text(title, style: const TextStyle(color: Colors.white,),),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imgurl.isNotEmpty)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    imgurl,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(width: 10,),
            Text(title.toString(), style: const TextStyle(
              fontSize: 27,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
              textAlign: TextAlign.center,),
            const SizedBox(height: 10,),
            Text("Date: ${date.toLocal().toString().split(' ')[0]}", style: const TextStyle(fontSize: 18, color: Colors.white),),
            const SizedBox(height: 10,),
            Text(description.toString(), style: const TextStyle(fontSize: 18, color: Colors.white),),
            const SizedBox(height: 10,),

            InkWell(
              onTap: () => _launchUrl(link),
              child: Text(
                link, style: const TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
