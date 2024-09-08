import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moviemania/Models/Movie.dart';
import 'package:moviemania/screen/favouriteList.dart';
import 'Home.dart';
import 'Heading.dart';
import 'package:moviemania/Widgets/Constants.dart';

import 'package:moviemania/Widgets/api.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

   final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Use SliverAppBar.large for background image and title
          SliverAppBar.large(
            pinned: true,
            leading: Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.only(top: 16, left: 16),
              decoration: BoxDecoration(
                  color: BackgroundColour.backgroundColor ==
                          BackgroundColour.isitdark
                      ? Colors.black87
                      : Colors.white70,
                  borderRadius: BorderRadius.circular(8)),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_rounded)),
            ),
            backgroundColor:
                BackgroundColour.backgroundColor == BackgroundColour.isitdark
                    ? Colors.black87
                    : Colors.white70,
            expandedHeight: 500,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Row(
                children: [
                  Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: BackgroundColour.backgroundColor ==
                              BackgroundColour.isitdark
                          ? Color(0xFFffffff)
                          : Color(0xFF5f0004), // Dynamic color based on theme
                    ),
                  ),
                  SizedBox(width: 5,),
                  IconToggleButton(movie: movie,),

                ],
              ),
              background: ClipRRect(
                child: Image.network(
                  '${Constants.imagePath}${movie.backdropPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
              ),
            ),
          ),

          // Use SliverToBoxAdapter for movie details
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Add widgets for movie details here
                  Center(
                    child: Text(
                      "Overview",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: BackgroundColour.backgroundColor ==
                                BackgroundColour.isitdark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    movie.overview,
                    textAlign: TextAlign.justify,
                  ),
                  //Text('dsdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddsssssssssssssssssss'),
                  //Text('dsdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddsssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddsssssssssssssssssss'),
                  // Add more detail widgets (release date, genre, etc.)
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: BackgroundColour.backgroundColor ==
                              BackgroundColour.isitdark
                          ? Colors.white
                          : Colors.black,

                    ),
                    borderRadius: BorderRadius.circular(10),

                    ),
                    child: Row(
                      children: [
                        Text(
                          'Rating',
                          style: TextStyle(fontSize: 17),
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Text('${movie.voteAverage.toStringAsFixed(1)}/10'),

                      ],
                    ),

                  ),
                  SizedBox(height: 10,),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: BackgroundColour.backgroundColor ==
                              BackgroundColour.isitdark
                          ? Colors.white
                          : Colors.black,

                    ),
                    borderRadius: BorderRadius.circular(10),

                    ),
                    child: Row(
                      children: [
                        Text(
                          'Release Date ',
                          style: TextStyle(fontSize: 17,),
                        ),
                        Text(
                          movie.releaseDate.toString().substring(0, 10), // Display only the first 10 characters
                          style: TextStyle(fontSize: 17),
                        ),

                      ],
                    ),

                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



 class IconToggleButton extends StatefulWidget {
   final Movie movie;

   IconToggleButton({required this.movie});

   @override
   _IconToggleButtonState createState() => _IconToggleButtonState(movie: movie);
}

class _IconToggleButtonState extends State<IconToggleButton> {
  bool _isIconToggled = false; // Track whether the icon is toggled or not
  static bool _isFavourite =false;
  final Movie movie;
  FavMovies favMovies = FavMovies();

  _IconToggleButtonState({required this.movie});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(_isIconToggled
          ? FontAwesomeIcons.solidHeart
          : FontAwesomeIcons.heart), // Toggle icon
      onPressed: () {
        setState(() {
          _isFavourite=!_isFavourite;
          _isIconToggled =
          !_isIconToggled; // Change the state to toggle the icon
        });
        // Update the favouriteList in the Movie object
        if (_isFavourite) {
          favMovies.addToFavourite(movie.id);
          print('added to fav');

        } else {
          favMovies.removeFromFavourite(movie.id);
          print('removed from fav');
        }
      },
      color: _isIconToggled
          ? Colors.red
          : Colors.grey, // Optional: Change color too
    );
  }
}
