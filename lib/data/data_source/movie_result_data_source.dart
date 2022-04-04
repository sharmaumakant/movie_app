import 'dart:convert';

import 'package:movie_app/data/core/api_constants_file.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/data/models/movies_result_model.dart';

import '../core/api_client.dart';

abstract class MovieResultDataSource{
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getComingSoon();
}

class MovieResultDataSourceImpl extends MovieResultDataSource{

  final ApiClient _client;

  MovieResultDataSourceImpl(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {

    final response = await _client.get('${ApiConstants.BASE_URL}trending/movie/day?api_key=${ApiConstants.API_KEY}');
    final trendingMovies = MoviesResultModel.fromJson(response).movies;
    print(trendingMovies);
    return trendingMovies;
    /*final response = await _client.get(Uri.parse(
      '${ApiConstants.BASE_URL}trending/movie/day?api_key=${ApiConstants.API_KEY}'),
      headers: {
        'Content-Type': 'application/json'
      },
    );

    print("Status code is ${response.statusCode}");

    if(response.statusCode == 200){
      final responseBody = json.decode(response.body);
      final movies = MoviesResultModel.fromJson(responseBody).movies;
      print(movies);
      return movies;
    }
    else{
      throw Exception(response.reasonPhrase);
    }*/
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await _client.get(
        '${ApiConstants.BASE_URL}movie/popular?api_key=${ApiConstants.API_KEY}');

      final popularMovies = MoviesResultModel.fromJson(response).movies;
      print(popularMovies);
      return popularMovies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await _client.get('${ApiConstants.BASE_URL}movie/upcoming?api_key=${ApiConstants.API_KEY}');
    final comingSoonMovies = MoviesResultModel.fromJson(response).movies;
    print(comingSoonMovies);
    return comingSoonMovies;
  }

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final response = await _client.get('${ApiConstants.BASE_URL}movie/now_playing?api_key=${ApiConstants.API_KEY}');
    final nowPlayingMovies = MoviesResultModel.fromJson(response).movies;
    print(nowPlayingMovies);
    return nowPlayingMovies;
  }

}