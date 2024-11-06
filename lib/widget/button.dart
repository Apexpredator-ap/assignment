import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  MyButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
