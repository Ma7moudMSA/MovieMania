import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moviemania/Models/Movie.dart';
import 'package:moviemania/screen/favouriteList.dart';
import 'package:moviemania/screen/login.dart';
import 'Home.dart';
import 'Heading.dart';
import 'package:moviemania/Widgets/Constants.dart';

import 'package:moviemania/Widgets/api.dart';

class DetailsScreen extends StatefulWidget {
  final Movie movie;

  const DetailsScreen({super.key, required this.movie});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  void initState() {
    super.initState();
    // Initialize movie favorite status before UI build
    widget.movie.loadFavouriteStatus();

  }

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
                  Container(
                    child: Text(
                      widget.movie.title,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: BackgroundColour.backgroundColor ==
                            BackgroundColour.isitdark
                            ? Color(0xFFffffff)
                            : Color(0xFFffffff), // Dynamic color based on theme
                      ),
                    ),
                    width: 150,
                  ),
                  SizedBox(width: 5,),
                  IconToggleButton(movie: widget.movie,),

                ],
              ),
              background: ClipRRect(
                child: Image.network(
                  '${Constants.imagePath}${widget.movie.backdropPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
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
                    widget.movie.overview,
                    textAlign: TextAlign.justify,
                  ),
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
                        Text('${widget.movie.voteAverage.toStringAsFixed(1)}/10'),

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
                          widget.movie.releaseDate.toString().substring(0, 10), // Display only the first 10 characters
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
  final Movie movie;
  FavMovies favMovies = FavMovies();

  _IconToggleButtonState({required this.movie});

  @override
  void initState() {
    super.initState();
    // Delay for 1 second, then refresh the state
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        // Call anything you want to refresh, like reloading the movie status
        movie.initializeMovie(movie);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(movie.isFavourite
          ? FontAwesomeIcons.solidHeart
          : FontAwesomeIcons.heart), // Toggle icon
      onPressed: () {
        setState(() {
          movie.toggleFavourite(movie);
          print('toggled fav');
        });
      },
      color: movie.isFavourite ? Colors.red : Colors.grey, // Optional: Change color too
    );
  }
}
