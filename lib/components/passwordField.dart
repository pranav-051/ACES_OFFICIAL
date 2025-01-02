import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomPasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final IconData icon;
  final TextInputType keyboardType;

  const CustomPasswordField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    required this.icon,
    this.keyboardType = TextInputType.text,
  });

  @override
  _CustomPasswordFieldState createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  // Toggle the password visibility
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscureText, // Hide text initially for password
      style: const TextStyle(color: Colors.black, height: 1), // Text color white
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(color: Colors.black), // Label text color
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: AppColors.gray), // Hint text color
        filled: true,
        fillColor: AppColors.lightGray2, // Background color
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // Border color
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // Focused border color
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black), // Enabled border color
        ),
        prefixIcon: Icon(widget.icon, color: AppColors.gray), // Icon color
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.gray,
          ),
          onPressed: _togglePasswordVisibility, // Toggle password visibility
        ),
      ),
    );
  }
}
