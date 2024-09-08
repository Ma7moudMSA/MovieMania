import 'dart:convert';

import 'package:moviemania/Models/RecommendationModel.dart';
import 'package:moviemania/Models/searchModel.dart';
import 'package:moviemania/Widgets/Constants.dart';
import 'package:http/http.dart' as http ;
import 'package:moviemania/Models/Movie.dart';

class Api{

  static const _trendingURL = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _genreURL = 'https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}';
  static const _nowplaying = 'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}';
  static const _searchedMovie='https://api.themoviedb.org/3/search/movie?api_key=${Constants.apiKey}';
  static const _recommended='https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';

  Future<List<Movie>> getTrendingMovies() async {
    final responses = await http.get(Uri.parse(_trendingURL));
    if (responses.statusCode == 200) {
      final decodeData = json.decode(responses.body)['results'] as List;
      print('decoded data');
      return decodeData.map((movie)=>Movie.fromJson(movie)).toList();
    }
    else
    {
      throw Exception('yarab ostor');
    }
  }

  Future<List<Movie>> getGenreMovies(int genreId) async {
    final url = Uri.parse('$_genreURL&with_genres=$genreId'); // Add genre ID parameter
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print('decoded data');
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to fetch movies by genre');
    }
  }

  Future<List<Movie>> getMoviebyID(List<int> movieIds) async {
    final url = 'https://api.themoviedb.org/3/movie/${movieIds.join(',')}/?api_key=${Constants.apiKey}';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print('decoded data');
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to fetch movies by ID');
    }
  }
  Future<List<Movie>> getNowPlayingMovies() async {
    final url = Uri.parse('$_nowplaying'); // Add genre ID parameter
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print('decoded data');
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to fetch movies by genre');
    }


  }
  Future<SearchModel> getSearchedMovie(String searchText) async {
    late String endPoint ="search/movie?query=$searchText";
    final url = Uri.parse('$_searchedMovie$endPoint');
    print("url $url");// Add genre ID parameter
    final response = await http.get(url,headers: {
        "Authorization":"Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MmMwMWUyYWI2OGM3NWFhMGMyM2MxMjRiMGU3NjFlNCIsIm5iZiI6MTcyNTcxNDc3MC4zNTcxMTYsInN1YiI6IjY2ZDg0MGJhOGNlZTY4ZDMzMjlkMzI4OSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.XQDEtBmWaAQgPGHiZlGUra0Byiv5qVwi6flLD9wDXoQ"
    });
    if (response.statusCode == 200) {

      print('Success');
      return SearchModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch searched movie');
    }


  }
  Future<RecommendationModel> getRecommendedMovies() async {
    final response = await http.get(Uri.parse(_recommended));
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)['results'] as List;
      print('200ok');
      return RecommendationModel.fromJson(jsonDecode(response.body));
    }
    else
    {
      throw Exception('Failed to fetch recommended movie');
    }
  }



}