part of 'movie_backdrop_bloc.dart';

@immutable
abstract class MovieBackdropEvent extends Equatable
{
  const MovieBackdropEvent();

  @override
  List<Object?> get props => [];
}

class MovieBackdropChangedEvent extends MovieBackdropEvent {
  final MovieEntity movieEntity;

  const MovieBackdropChangedEvent(this.movieEntity): super();

  @override
  List<Object?> get props => [movieEntity];
}
