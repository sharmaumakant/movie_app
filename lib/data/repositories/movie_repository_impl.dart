import 'package:dartz/dartz.dart';
import 'package:movie_app/data/data_source/movie_result_data_source.dart';
import 'package:movie_app/data/models/movie_model.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository{

  final MovieResultDataSource _dataSource;

  MovieRepositoryImpl(this._dataSource);

  @override
  Future<Either<AppError, List<MovieModel>>> getTrending() async {
    try {
      return Right(await _dataSource.getTrending());
    } on Exception {
      return const Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getPopular() async {
    try{
      return Right(await _dataSource.getPopular());
    } on Exception{
      return const Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieModel>>> getNowPlaying() async {
    try{
      return Right(await _dataSource.getNowPlaying());
    } on Exception {
      return const Left(AppError('Something went wrong'));
    }
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> getUpcoming() async {
    try{
      return Right(await _dataSource.getComingSoon());
    } on Exception {
      return const Left(AppError('Something went wrong'));
    }
  }

}