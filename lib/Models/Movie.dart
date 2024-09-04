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



//"page":1,"results":[{"backdrop_path":"/qr69tjjXcZLKjqD48aAq6FzBjf9.jpg","id":1032823,"title":"Trap","original_title":"Trap","overview":"A father and teen daughter attend a pop concert, where they realize they're at the center of a dark and sinister event.","poster_path":"/jwoaKYVqPgYemFpaANL941EF94R.jpg","media_type":"movie","adult":false,"original_language":"en"