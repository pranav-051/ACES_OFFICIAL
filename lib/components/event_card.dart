import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EventCard extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final String date;
  final String time;
  final String mode;
  final String formLink; // Google Form link
  final VoidCallback? onRegister;

  const EventCard({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.date,
    required this.time,
    required this.mode,
    required this.formLink,
    this.onRegister,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool isButtonDisabled = false;

  Future<void> _openForm(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.inAppWebView); // Opens in-app
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF7F7FF), // Subtle off-white background
      elevation: 6, // Slight shadow for depth
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.black.withOpacity(0.1), width: 1.5), // Black border
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(widget.image),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Date: ${widget.date}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Time: ${widget.time}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Mode: ${widget.mode}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: widget.mode == "Online" ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: isButtonDisabled
                      ? null
                      : () async {
                    setState(() {
                      isButtonDisabled = true;
                    });
                    await _openForm(widget.formLink);
                    setState(() {
                      isButtonDisabled = false;
                    });
                    if (widget.onRegister != null) {
                      widget.onRegister!();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: isButtonDisabled
                        ? Colors.grey
                        : Colors.blueAccent, // Button color changes when disabled
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
