import 'dart:convert';

import 'package:moviemania/Widgets/Constants.dart';
import 'package:http/http.dart' as http ;
import 'package:moviemania/Models/Movie.dart';

class Api{

  static const _trendingURL = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';

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

}