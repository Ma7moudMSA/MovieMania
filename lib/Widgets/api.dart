import 'dart:convert';

import 'package:moviemania/Widgets/Constants.dart';
import 'package:http/http.dart' as http;
import 'package:moviemania/Models/Movie.dart';

import '../Models/Search_Movies.dart';
import '../Models/idmovie.dart';

class Api {
  final String baseUrl = 'https://api.themoviedb.org/3';

  static const _trendingURL =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';
  static const _genreURL =
      'https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}';
  static const _nowplaying =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}';
  static const _searchedMovie =
      'https://api.themoviedb.org/3/search/movie?api_key=${Constants.apiKey}';
  static const _recommended =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}';



  Future<List<Movie>> getTrendingMovies() async {
    final responses = await http.get(Uri.parse(_trendingURL));
    if (responses.statusCode == 200) {
      final decodeData = json.decode(responses.body)['results'] as List;
      print('decoded data');
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('yarab ostor');
    }
  }

  Future<List<Movie>> getGenreMovies(int genreId) async {
    final url =
        Uri.parse('$_genreURL&with_genres=$genreId'); // Add genre ID parameter
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print('decoded data');
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to fetch movies by genre');
    }
  }

  Future<List<Movie>> getMoviesbyID(List<int> movieIds) async {
    final url =
        'https://api.themoviedb.org/3/movie/${movieIds.join(',')}/?api_key=${Constants.apiKey}';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      print('decoded data');
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to fetch movies by ID ${url}');
    }
  }

  Future<idclass> getMovieById(int movieId) async {
    final url =
        'https://api.themoviedb.org/3/movie/$movieId?api_key=YOUR_API_KEY';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final movieData = json.decode(response.body);
      return idclass.fromJson(movieData);
    } else {
      throw Exception('Failed to fetch movie with ID $movieId');
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





  Future<List<Movie>> getMoviebyID(List<int> movieIds) async {
    final movies = <Movie>[]; // Empty list to store all fetched movies

    // Split movie IDs into smaller batches (adjust batch size as needed)
    const batchSize = 2; // Adjust based on API limits or performance needs
    for (var i = 0; i < movieIds.length; i += batchSize) {
      final batch = movieIds.sublist(i, i + batchSize);
      final url =
          'https://api.themoviedb.org/3/movie/${batch.join(',')}/?api_key=${Constants.apiKey}';

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        movies
            .addAll(decodedData.map((movie) => Movie.fromJson(movie)).toList());
      } else {
        throw Exception(
            'Failed to fetch movies by ID for some IDs'); // More specific error message
      }
    }

    return movies;
  }
  Future<void> fetchMoviesByTitles(List<String> titles) async {

    for (String title in titles) {
      final url = Uri.parse('$baseUrl/search/movie?api_key=${Constants.apiKey}&query=$title');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print('Movie results for "$title": ${data['results']}');
      } else {
        print('Failed to load movie: $title');
      }
    }
  }

  static Future<Map<String, dynamic>> searchMovies(String query) async {
    final url =
        'https://api.themoviedb.org/search/movie?api_key=${Constants.apiKey}&query=$query';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> fetchMoviesByIds(List<int> ids) async {
    final List<Future<Movie>> futures = [];

    for (int id in ids) {
      final url = Uri.parse('https://api.themoviedb.org/3/movie/$id?api_key=${Constants.apiKey}');
      futures.add(http.get(url).then((response) {
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          final results = data['results'] as List;
         // futures.addAll(results.map((json) => Movie.fromJson(json)).toList());
          return Movie.fromJson(data);
        } else {
          throw Exception('Failed to fetch movie by ${id}');
        }
      }));
    }

    return Future.wait(futures);
  }

}



