import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class MovieCarousalEvent extends Equatable{
  const MovieCarousalEvent();

  @override
  List<Object?> get props => [];
}

class CarousalLoadEvent extends MovieCarousalEvent{

  final int defaultIndex;

  const CarousalLoadEvent({this.defaultIndex = 0}):
        assert(defaultIndex >=0, 'Default index cannot be less than zero');

  @override
  List<Object?> get props => [defaultIndex];

}
