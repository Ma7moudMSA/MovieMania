import 'package:flutter/material.dart';
import 'package:moviemania/Models/Movie.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(movie.title),
      ),
    );
  }
}
