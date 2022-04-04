import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class GetNowPlaying {

  final MovieRepository _repository;

  GetNowPlaying(this._repository);

  Future<Either<AppError, List<MovieEntity>>> call() async {
    return await _repository.getNowPlaying();
  }

}