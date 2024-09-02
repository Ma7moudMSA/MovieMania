import 'package:flutter/material.dart';

class search extends StatelessWidget {
  const search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
      TextFormField(
      decoration: InputDecoration(
      labelText: "Search"
      ),
    ),
    ],
    ),
    ) ;
  }
}
