import 'dart:ui' as ui;
import 'package:aces/userHome/bottomNavBar/page1.dart';
import 'package:aces/components/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'past_event_gallery_images_list.dart';

class event_gallery extends StatefulWidget {
  const event_gallery({Key? key}) : super(key: key);

  @override
  State<event_gallery> createState() => _event_gallery();
}

class _event_gallery extends State<event_gallery> {
  Future<ui.Image> _decodeImage(String assetPath) async {
    final data = await DefaultAssetBundle.of(context).load(assetPath);
    return decodeImageFromList(data.buffer.asUint8List());
  }

  Widget _buildGridItem(String assetPath) {
    return FutureBuilder<ui.Image>(
      future: _decodeImage(assetPath),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError || !snapshot.hasData) {
          return const Icon(Icons.error, size: 50, color: Colors.red);
        }

        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  child: InteractiveViewer(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        assetPath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                assetPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

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
        title: const CustomText(
          text: "Past Events Gallery",
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          color: Colors.black,)
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.count(
          crossAxisCount: 2, // Number of columns
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          itemCount: past_event_gallery_images_list.length, // Use the imported list
          itemBuilder: (context, index) {
            return _buildGridItem(past_event_gallery_images_list[index]);
          },
        ),
      ),
    );
  }
}
