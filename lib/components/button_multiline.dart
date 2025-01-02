import 'package:flutter/material.dart';

class CustomMultilineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text1;
  final String text2;
  final Color backgroundColor;
  final Color? textColor; // Optional text color parameter
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final double? height; // Optional height parameter
  final double? width;  // Optional width parameter

  const CustomMultilineButton({
    Key? key,
    required this.onPressed,
    required this.text1,
    required this.text2,
    this.backgroundColor = const Color(0xFF023E7D),
    this.textColor, // Initialize optional text color
    this.textStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    this.padding = const EdgeInsets.symmetric(vertical: 15),
    this.height, // Initialize height
    this.width,  // Initialize width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: Size(width ?? 100, height ?? 50), // Use default if null
        backgroundColor: backgroundColor, // Background color
        padding: padding, // Padding
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Shrinks to fit the content
        children: [
          Text(
            text1,
            style: textStyle.copyWith(color: textColor ?? textStyle.color),
          ),
          Text(
            text2,
            style: textStyle.copyWith(color: textColor ?? textStyle.color),
          ),
        ],
      ),
    );
  }
}
