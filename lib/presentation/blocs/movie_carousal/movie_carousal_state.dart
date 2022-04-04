part of 'movie_carousal_bloc.dart';

@immutable
abstract class MovieCarousalState extends Equatable{
  const MovieCarousalState();

  @override
  List<Object?> get props => [];
}

class MovieCarousalInitial extends MovieCarousalState {}

class MovieCarousalError extends MovieCarousalState {
}

class MovieCarousalLoaded extends MovieCarousalState {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarousalLoaded({
    required this.movies,
    this.defaultIndex = 0
  }): assert(defaultIndex >=0, 'Default index cannot be less than zero');

  @override
  List<Object?> get props => [movies, defaultIndex];
}
