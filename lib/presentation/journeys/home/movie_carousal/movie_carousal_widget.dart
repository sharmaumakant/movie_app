import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousal/movie_data_widget.dart';
import 'package:movie_app/presentation/widgets/movie_app_bar.dart';
import 'movie_backdrop_widget.dart';
import 'movie_page_view.dart';

class MovieCarousalWidget extends StatelessWidget {

  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarousalWidget({
    Key? key,
    required this.movies,
    this.defaultIndex = 0}) :assert(defaultIndex >=0, 'default index should not be less than zero'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const MovieBackdropWidget(),

        Column(
            children: [
              const MovieAppBar(),
              MoviePageView(movies: movies, defaultIndex: defaultIndex,),
              const MovieDataWidget()
            ]
        )
        ,
      ]
    );
  }
}
