import 'package:movie_app/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final double voteAverage;
  final String overview;
  final String releaseDate;
  final int id;
  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int voteCount;
  final String originalLanguage;
  final String originalTitle;
  final String posterPath;
  final String title;
  final bool video;
  final double popularity;
  final String? mediaType;

  const MovieModel({
      required this.voteAverage,
      required this.overview,
      required this.releaseDate,
      required this.id,
      required this.adult,
      required this.backdropPath,
      required this.genreIds,
      required this.voteCount,
      required this.originalLanguage,
      required this.originalTitle,
      required this.posterPath,
      required this.title,
      required this.video,
      required this.popularity,
      required this.mediaType}) : super(id: id,
      voteAverage: voteAverage,
      overview: overview,
      releaseDate: releaseDate,
      backdropPath: backdropPath,
      posterPath: posterPath,
      title: title);

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
    voteAverage: json['vote_average']?.toDouble() ?? 0.0,
    overview: json['overview'],
    releaseDate: json['release_date'],
    id: json['id'],
    adult: json['adult'],
    backdropPath: json['backdrop_path'],
    genreIds: json['genre_ids'].cast<int>(),
    voteCount: json['vote_count'],
    originalLanguage: json['original_language'],
    originalTitle: json['original_title'],
    posterPath: json['poster_path'],
    title: json['title'],
    video: json['video'],
    popularity: json['popularity']?.toDouble() ?? 0.0,
    mediaType: json['media_type']
  );}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['vote_average'] = voteAverage;
    data['overview'] = overview;
    data['release_date'] = releaseDate;
    data['id'] = id;
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['vote_count'] = voteCount;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['poster_path'] = posterPath;
    data['title'] = title;
    data['video'] = video;
    data['popularity'] = popularity;
    data['media_type'] = mediaType;
    return data;
  }
}