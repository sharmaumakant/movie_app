import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/data_source/movie_result_data_source.dart';
import 'package:movie_app/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_now_playing.dart';
import 'package:movie_app/domain/usecases/get_popular.dart';
import 'package:movie_app/domain/usecases/get_trending.dart';
import 'package:movie_app/domain/usecases/get_upcoming.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

import '../presentation/blocs/movie_carousal/movie_carousal_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {

  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<MovieResultDataSource>(() => MovieResultDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance.registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetNowPlaying>(() => GetNowPlaying(getItInstance()));
  getItInstance.registerLazySingleton<GetUpcoming>(() => GetUpcoming(getItInstance()));

  //getItInstance.registerFactory(() => MovieCarousalBloc(getTrending: getItInstance()));
  getItInstance.registerFactory(() => MovieCarousalBloc(getTrending: getItInstance(),
      movieBackdropBloc: getItInstance()));

  getItInstance.registerFactory(() => MovieBackdropBloc());
}