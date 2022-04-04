import 'dart:ffi';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MovieEntity extends Equatable {
  final int id;
  final num voteAverage;
  final String overview;
  final String releaseDate;
  final String? backdropPath;
  final String posterPath;
  final String title;

  const MovieEntity({
    required this.id,
    required this.voteAverage,
    required this.overview,
    required this.releaseDate,
    required this.backdropPath,
    required this.posterPath,
    required this.title
  });

  @override
  List<Object> get props => [id, title];

  @override
  bool get stringify => true;


}