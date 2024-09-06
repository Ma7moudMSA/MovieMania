import 'package:flutter/material.dart';
import 'package:moviemania/screen/Home.dart';
import 'package:moviemania/screen/signUp.dart';


class Heading extends StatelessWidget {
  final String headingText;  // Define a final variable to hold the heading text

  const Heading({
    Key? key,
    required this.headingText,  // Accept the string as a required parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      headingText,  // Use the string passed to this widget
      style: TextStyle(
        fontSize: 22,               // Font size for the heading
        fontWeight: FontWeight.bold, // Bold text for emphasis
        color: backgroundColor == isitdark ? Colors.white70 : Colors.black87,  // Dynamic color based on theme
        letterSpacing: 1.2,          // Add spacing between letters for a cinematic feel
      ),
    );
  }
}
