import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final Color fillColor;
  final Color textColor;
  final Color hintColor;
  final Color iconColor;

  TextFieldInput({
    required this.controller,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    this.fillColor = Colors.white,
    this.textColor = Colors.black,
    this.hintColor = Colors.black45,
    this.iconColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor),
          filled: true,
          fillColor: fillColor,
          prefixIcon: Icon(icon, color: iconColor),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
