import 'package:flutter/material.dart';
import 'package:moviemania/Widgets/Constants.dart';

import '../Models/idmovie.dart';
import '../Widgets/api.dart';
import '../Widgets/footer.dart';
import 'login.dart';
import 'package:moviemania/Models/Movie.dart';
import 'package:moviemania/Widgets/TrendingMovies.dart';
class favouriteList extends StatelessWidget {
 // late Future<idclass> favouriteMovies;
  late Future<List<Movie>> favouriteMovies2;


  @override
  Widget build(BuildContext context) {
    int movieId =646097;
    List <int>movieids =[646097];
    favouriteMovies2 = Api().getMoviesbyID(movieids);
    //favouriteMovies = Api().getMovieById(movieId);
    return Scaffold(
        appBar: AppBar(
          title: Text('Favourite list'),
          leading: Container(),
          leadingWidth: 0,

        ),
      body: SizedBox(
        child: FutureBuilder(
            future: favouriteMovies2,
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


      bottomNavigationBar:  Footer(),
    );
  }
}
