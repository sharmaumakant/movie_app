import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/entities/app_error.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/use_cases.dart';

import '../entities/no_params.dart';

class GetTrending extends UseCases<List<MovieEntity>, NoParams>{

  final MovieRepository _repository;

  GetTrending(this._repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams params) async {
    return await _repository.getTrending();
  }

}