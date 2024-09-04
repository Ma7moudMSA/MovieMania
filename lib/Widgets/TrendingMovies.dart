import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TrendingMovies extends StatelessWidget {
   TrendingMovies({
    super.key,
  });

  final List<String> images = [
    'asset/action.jpeg',
    'asset/animated.jpeg',
    'asset/carton.jpeg',
    'asset/horror.jpeg',
    'asset/marvel.jpeg',
    'asset/romance.jpeg',
    'asset/sci-fi.jpeg',
    'asset/thrillier.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: images.length,
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              images[itemIndex],
              fit: BoxFit.cover,
              height: 100,

            ),
          );
        },
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 2),
        ),
      ),
    );
  }
}