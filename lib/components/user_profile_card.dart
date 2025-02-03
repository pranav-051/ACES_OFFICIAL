import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UserProfileCard extends StatelessWidget {
  final String name;
  final String imageAssetPath; // Updated to Asset Path
  final String linkedinUrl;
  final String emailUrl;
  final String githubUrl;

  const UserProfileCard({
    Key? key,
    required this.name,
    required this.imageAssetPath,
    required this.linkedinUrl,
    required this.emailUrl,
    required this.githubUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(imageAssetPath), // Use AssetImage
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.link),
                  color: Colors.blue,
                  onPressed: () {
                    launchURL(linkedinUrl);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.email),
                  color: Colors.red,
                  onPressed: () {
                    launchURL(emailUrl);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.code),
                  color: Colors.black,
                  onPressed: () {
                    launchURL(githubUrl);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.inAppWebView, // Opens the URL in an in-app browser
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
