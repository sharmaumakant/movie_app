import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/domain/entities/no_params.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

import '../../../domain/entities/movie_entity.dart';
import 'movie_carousal_event.dart';

part 'movie_carousal_state.dart';

class MovieCarousalBloc extends Bloc<MovieCarousalEvent, MovieCarousalState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarousalBloc({
    required this.getTrending,
    required this.movieBackdropBloc}) : super(MovieCarousalInitial()) {

    on<MovieCarousalEvent>((event, emit) async {
      if(event is CarousalLoadEvent) {
        final movieEither = await getTrending(NoParams());
        movieEither.fold(
                (l) => MovieCarousalError(),
                (r) => {
                  emit(MovieCarousalLoaded(movies: r, defaultIndex: event.defaultIndex))
                }
        );
      }
    });
  }
}
