class Movie {
  int id = 0;
  String title = '';
  double voteAverage = 0.0;
  String releaseDate = '';
  String overview = '';
  String posterPath = '';

  Movie(this.id, this.title, this.voteAverage, this.releaseDate, this.overview,
      this.posterPath);

  //get data in JSON format & output a movie object
  Movie.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    voteAverage = parsedJson['vote_average'] * 1.0;
    releaseDate = parsedJson['release_date'];
    overview = parsedJson['overview'];
    posterPath = parsedJson['poster_path'];
  }
}
