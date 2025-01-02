import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color backgroundColor;
  final Color? textColor; // Optional text color parameter
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final double? height; // Optional height parameter
  final double? width;  // Optional width parameter

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = const Color(0xFF023E7D),
    this.textColor, // Initialize optional text color
    this.textStyle = const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
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
        maximumSize: Size(width ?? 200, height ?? 70), // Use default if null
        backgroundColor: backgroundColor, // Background color
        padding: padding, // Padding
        textStyle: textStyle, // Default text style
      ),
      child: Text(
        text,
        style: textStyle.copyWith(color: textColor ?? textStyle.color), // Override color if provided
      ),
    );
  }
}
