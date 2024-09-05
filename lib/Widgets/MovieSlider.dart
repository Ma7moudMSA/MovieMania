
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
   MovieSlider({
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
    'asset/thrillier.jpeg'
  ];
   @override
   Widget build(BuildContext context) {
     return SizedBox(
       height: 200,
       width: double.infinity,
       child: ListView.builder(
           scrollDirection: Axis.horizontal,

           physics: BouncingScrollPhysics(),
       itemCount: images.length,
       itemBuilder: (context,
           index) {
     return Padding(
     padding: const EdgeInsets.all(8.0),
     child: ClipRRect(
     borderRadius: BorderRadius.circular(8),
     child: Image.asset(
     images[index],
     fit: BoxFit.cover,
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


