import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moviemania/Widgets/api.dart';
import 'package:moviemania/Widgets/page%20footer.dart';
import 'package:moviemania/screen/login.dart';
import 'package:moviemania/screen/splash_screen.dart';
import '../Models/Movie.dart';
import '../Models/idmovie.dart';
import '../Widgets/MovieSlider.dart';
import '../Widgets/TrendingMovies.dart';
import '../Widgets/footer.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import 'Heading.dart';

class BackgroundColour {
  static bool backgroundColor = true; // 1 for dark theme, 0 for light theme
  static bool isitdark = false;
}

Widget buildIcon() {
  return BackgroundColour.backgroundColor == BackgroundColour.isitdark
      ? Icon(
          Icons.dark_mode,
          color: Colors.white,
        )
      : Icon(Icons.dark_mode, color: Colors.black45);
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> comedyMovies;
  late Future<List<Movie>> scifiMovies;
  late Future<List<Movie>> horrorMovies;

  late Future<List<Movie>> nowplayingmovies;
  late Future<List<Movie>> idmovies;
  late Future<idclass> favmovie;
  List<String> movieTitles = ['Inception', 'The Dark Knight', 'Interstellar'];
  List<int> Ids = [27205, 155, 157336];


  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    comedyMovies = Api().getGenreMovies(35);
    scifiMovies = Api().getGenreMovies(878);
    horrorMovies = Api().getGenreMovies(27);
    nowplayingmovies = Api().getNowPlayingMovies();
    favmovie = Api().getMovieById(646097);
    idmovies =Api().fetchMoviesByIds(Ids);

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "MovieMania",
      themeMode: BackgroundColour.backgroundColor == BackgroundColour.isitdark
          ? ThemeMode.dark
          : ThemeMode.light,
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black38,
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:

              // SvgPicture.asset("asset/MovieMania.svg",height: 100,fit: BoxFit.cover,),
              Center(
                  child: Image.asset(
            'asset/MovieMania.webp',
            fit: BoxFit.cover,
            height: 300,
            filterQuality: FilterQuality.high,
          )),

//Center(child: Text("Moviemania")),
          leading: GestureDetector(
            onTap: () {
              setState(() {
                BackgroundColour.isitdark = !BackgroundColour.isitdark;
              });
            },
            child: buildIcon(),
          ),
          actions: [
            Row(
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => login()));
                  },
                  child: Text(
                    "create account",
                    style: TextStyle(
                        color: Color(0xff420516),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Heading(headingText: "Trending"),
              SizedBox(
                height: 3,
              ),
              SizedBox(
                child: FutureBuilder(
                    future://idmovies,
                    trendingMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        //List<Movie> movielist = [];
                        //final data = snapshot.data;
                        return TrendingMovies(
                          snapshot: snapshot,
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
              // TrendingMovies(),
              Heading(headingText: "Now Playing"),
              SliderGallery(nowplayingmovies),
              SizedBox(
                height: 32,
              ),
              Heading(headingText: "Comedy"),
              //MovieSlider(),
              SliderGallery(comedyMovies),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Heading(headingText: "Sci-fi"),
              ),
              //MovieSlider(),
              SliderGallery(scifiMovies),
              SizedBox(
                height: 32,
              ),
              Heading(headingText: "Horror"),
              SliderGallery(horrorMovies),
              //SliderGallery(genre)

              //MovieSlider(),
              //Divider(color: Colors.black,height: 1,),
              pageFooter(),
            ],
          ),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }

  SizedBox SliderGallery(Future<List<Movie>> genre) {
    return SizedBox(
      child: FutureBuilder(
          future: genre,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              //List<Movie> movielist = [];
              //final data = snapshot.data;
              return MovieSlider(
                snapshot: snapshot,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
