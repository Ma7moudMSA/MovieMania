// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

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
  String backdropPath;
  int id;
  String title;
  String originalTitle;
  String overview;
  String posterPath;
  MediaType mediaType;
  bool adult;
  OriginalLanguage originalLanguage;
  List<int> genreIds;
  double popularity;
  DateTime releaseDate;
  bool video;
  double voteAverage;
  int voteCount;

  Movie({
    required this.backdropPath,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.adult,
    required this.originalLanguage,
    required this.genreIds,
    required this.popularity,
    required this.releaseDate,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    backdropPath: json["backdrop_path"],
    id: json["id"],
    title: json["title"],
    originalTitle: json["original_title"],
    overview: json["overview"],
    posterPath: json["poster_path"],
    mediaType: mediaTypeValues.map[json["media_type"]]!,
    adult: json["adult"],
    originalLanguage: originalLanguageValues.map[json["original_language"]]!,
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    popularity: json["popularity"]?.toDouble(),
    releaseDate: DateTime.parse(json["release_date"]),
    video: json["video"],
    voteAverage: json["vote_average"]?.toDouble(),
    voteCount: json["vote_count"],
  );

  Map<String, dynamic> toJson() => {
    "backdrop_path": backdropPath,
    "id": id,
    "title": title,
    "original_title": originalTitle,
    "overview": overview,
    "poster_path": posterPath,
    "media_type": mediaTypeValues.reverse[mediaType],
    "adult": adult,
    "original_language": originalLanguageValues.reverse[originalLanguage],
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "popularity": popularity,
    "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "video": video,
    "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}

enum MediaType {
  MOVIE
}

final mediaTypeValues = EnumValues({
  "movie": MediaType.MOVIE
});

enum OriginalLanguage {
  EN
}

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN
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



/*
class Movie {
  String Title;
  String backDroptPath;
  String originalTitle;
  String overview;
  String PosterPath;
  String ReleaseDate;
  String voteAverage;

  Movie({
    required this.backDroptPath,
    required this.originalTitle,
    required this.overview,
    required this.PosterPath,
    required this.ReleaseDate,
    required this.Title,
    required this.voteAverage,
});
  factory Movie.fromJson(Map<String,dynamic> json ){
    return Movie(backDroptPath: json["backdrop_path"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        PosterPath: json["poster_path"],
        ReleaseDate: json["release_date"],
        Title: json["title"],
        voteAverage: json["vote_average"]);
  }

  
}

*/

//"page":1,"results":[{"backdrop_path":"/qr69tjjXcZLKjqD48aAq6FzBjf9.jpg","id":1032823,"title":"Trap","original_title":"Trap","overview":"A father and teen daughter attend a pop concert, where they realize they're at the center of a dark and sinister event.","poster_path":"/jwoaKYVqPgYemFpaANL941EF94R.jpg","media_type":"movie","adult":false,"original_language":"en"