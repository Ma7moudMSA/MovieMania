import 'package:flutter/material.dart';
import 'package:moviemania/Models/Movie.dart';
import 'Home.dart';
import 'Heading.dart';
import 'package:moviemania/Widgets/Constants.dart';

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
              title: Text(
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
                    )),
                    child: Container(
                      child: Text(
                        'Rate ${movie.voteAverage}',
                        style: TextStyle(fontSize: 17),
                      ),
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
