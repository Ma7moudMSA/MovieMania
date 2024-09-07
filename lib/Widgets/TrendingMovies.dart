import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:moviemania/Widgets/Constants.dart';
import 'package:moviemania/Models/Movie.dart';
import 'package:moviemania/screen/DetailsScreen.dart';

class TrendingMovies extends StatelessWidget {
  TrendingMovies({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  /*
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
*/
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                           DetailsScreen(movie: snapshot.data[itemIndex])));
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 300,
                  width: 200,
                  child: Image.network(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}',
                  ),
                )
                /*Image.asset(
                images[itemIndex],
                fit: BoxFit.cover,
                height: 100,

              ),
              */

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
