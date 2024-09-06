import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';

class MovieSlider extends StatelessWidget {
  MovieSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  /* final List<String> images = [
    'asset/action.jpeg',
    'asset/animated.jpeg',
    'asset/carton.jpeg',
    'asset/horror.jpeg',
    'asset/marvel.jpeg',
    'asset/romance.jpeg',
    'asset/sci-fi.jpeg',
    'asset/thrillier.jpeg'
  ];
  */

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constants.imagePath}${snapshot.data[index].posterPath}',
                ),
                height: 200,
                width: 200,
              ),
            ),
          );
        },
      ),
    );
  }
}
