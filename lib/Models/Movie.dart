// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  Welcome({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}
class Movie {
  bool isFavourite;
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  OriginalLanguage originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  DateTime releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.isFavourite = false,
  });
  // Method to save 'isFavourite' status locally
  Future<void> saveFavouriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFavourite_$id', isFavourite);  // Save using movie id as key
    print('save is runned succesfuly');
  //  print('is favourite is ${isFavourite}');

  }
  void toggleFavourite(Movie movie) {
   // print('is favourite was ${movie.isFavourite}');
    movie.isFavourite = !movie.isFavourite;
   // print('is favourite is ${movie.isFavourite}');

    movie.saveFavouriteStatus();
  }

// When initializing or refreshing the data
  void initializeMovie(Movie movie) async {
    print('is favourite was ${movie.isFavourite}');
    await movie.loadFavouriteStatus();
    print('is favourite become  ${movie.isFavourite}');
  }

  // Method to load 'isFavourite' status from local storage
  Future<void> loadFavouriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    isFavourite = prefs.getBool('isFavourite_$id') ?? false; // Load using movie id as key
  }

  /* Future<void> setIsFavourite(int movieId, bool isFavourite) async {
   * final prefs = await SharedPreferences.getInstance();
   * await prefs.setBool('isFavourite_$movieId', isFavourite);
  } */

  factory Movie.fromJson(Map<String, dynamic> json) {
    try {
      return Movie(
        adult: json["adult"] ?? false, // Default to false if not present
        backdropPath: json["backdrop_path"] ?? "", // Default to empty string
        genreIds: List<int>.from(json["genre_ids"]?.map((x) => x)), // Handle null
        id: json["id"], // Required field, will throw exception if missing
        originalLanguage: originalLanguageValues.map[json["original_language"]] ?? OriginalLanguage.NA,
        originalTitle: json["original_title"] ?? "", // Default to empty string
        overview: json["overview"] ?? "", // Default to empty string
        popularity: json["popularity"]?.toDouble(), // Handle null
        posterPath: json["poster_path"] ?? "", // Default to empty string
        releaseDate: DateTime.tryParse(json["release_date"]) ?? DateTime.now(), // Handle invalid format or missing date
        title: json["title"] ?? "", // Default to empty string
        video: json["video"] ?? false, // Default to false if not present
        voteAverage: json["vote_average"]?.toDouble(), // Handle null
        voteCount: json["vote_count"] ?? 0, // Default to 0 if not present
      );
    } on FormatException catch (e) {
      // Handle format exception (e.g., invalid date format)
      print("Error parsing JSON: $e");
      // You can return a default Movie object or throw a custom exception here
      return Movie(
        adult: false,
        backdropPath: "",
        genreIds: [],
        id: 0,
        originalLanguage: OriginalLanguage.NA,
        originalTitle: "Unknown",
        overview: "N/A",
        popularity: 0,
        posterPath: "",
        releaseDate: DateTime.now(),
        title: "Unknown",
        video: false,
        voteAverage: 0,
        voteCount: 0,
      );
    } catch (e) {
      // Handle other exceptions (e.g., missing required field)
      print("Unexpected error parsing JSON: $e");
      // You can return a default Movie object or throw a custom exception here
      return Movie(
        adult: false,
        backdropPath: "",
        genreIds: [],
        id: 0,
        originalLanguage: OriginalLanguage.NA,
        originalTitle: "Unknown",
        overview: "N/A",
        popularity: 0,
        posterPath: "",
        releaseDate: DateTime.now(),
        title: "Unknown",
        video: false,
        voteAverage: 0,
        voteCount: 0,
      );
    }

  }

/*
  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    adult: json["adult"],
    backdropPath: json["backdrop_path"],
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    originalLanguage: originalLanguageValues.map[json["original_language"]] ?? OriginalLanguage.NA,
    //originalLanguage: originalLanguageValues.map[json["original_language"]]!,
    originalTitle: json["original_title"],
    overview: json["overview"],
    popularity: json["popularity"]?.toDouble(),
    posterPath: json["poster_path"],
    releaseDate: DateTime.parse(json["release_date"]),
    title: json["title"],
    video: json["video"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
  );
*/

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "backdrop_path": backdropPath,
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "id": id,
    "original_language": originalLanguageValues.reverse[originalLanguage],
    "original_title": originalTitle,
    "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "title": title,
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}

enum OriginalLanguage {
  EN,
  ES,
  KO,
  PT,
  TH,
  CN,
  FR,
  HI,
  NA
}

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "ko": OriginalLanguage.KO,
  "pt": OriginalLanguage.PT,
  "th": OriginalLanguage.TH,
  "cn": OriginalLanguage.CN,
  "fr": OriginalLanguage.FR,
  "hi": OriginalLanguage.HI,
  "N/A": OriginalLanguage.NA,


});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
class FavMovies {
  // A static list that can be modified
  static List<int> favouriteList = [];

  // Add a movie ID to the favourites
  void addToFavourite(int movieId) {
    favouriteList.add(movieId);
  }

  // Remove a movie ID from the favourites
  void removeFromFavourite(int movieId) {
    favouriteList.remove(movieId);
  }

  // Access the current favourite list
  static List<int> getFavourites() {
    return favouriteList;
  }
}
