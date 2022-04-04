part of 'movie_backdrop_bloc.dart';

@immutable
abstract class MovieBackdropState extends Equatable
{
  @override
  List<Object?> get props => [];
}

class MovieBackdropInitial extends MovieBackdropState {}

class MovieBackdropChanged extends MovieBackdropState {

  final MovieEntity movieEntity;

  MovieBackdropChanged(this.movieEntity) : super();

  @override
  List<Object?> get props => [movieEntity];

}
