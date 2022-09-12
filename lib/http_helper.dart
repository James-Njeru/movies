import 'dart:convert';
import 'dart:io';
import './movie.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String urlKey = 'api_key=f5463636768931d52a491211772b3872';
  final String urlBase = 'https://api.themoviedb.org/3/movie';
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-US';
  final String urlSearchBase =
      'https://api.themoviedb.org/3/search/movie?api_key=f5463636768931d52a491211772b3872&query=';

  Future<List?> getUpcoming() async {
    final String upcoming = urlBase + urlUpcoming + urlKey + urlLanguage;

    //create url connection
    http.Response result = await http.get(Uri.parse(upcoming));
    //read response
    if (result.statusCode == HttpStatus.ok) {
      //transform obtained string to object
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }

  Future<List?> findMovies(String title) async {
    final String query = urlSearchBase + title;
    http.Response result = await http.get(Uri.parse(query));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final movieMap = jsonResponse['results'];
      List movies = movieMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }
}
