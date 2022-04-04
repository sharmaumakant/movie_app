import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/constants/size_constants.dart';
import 'package:movie_app/common/extensions/size_extentions.dart';
import 'package:movie_app/common/screenutil/screenutil.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousal/movie_animated_card_widget.dart';
import 'package:movie_app/presentation/journeys/home/movie_carousal/movie_card_widget.dart';

class MoviePageView extends StatefulWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MoviePageView({
    Key? key,
    required this.movies,
    required this.defaultIndex}) : super(key: key);

  @override
  State<MoviePageView> createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.defaultIndex,
      keepPage: false,
      viewportFraction: 0.7
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
        height: ScreenUtil.defaultHeight * 0.35,
        child: PageView.builder(
          controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
            final movieEntity = widget.movies[index];
            return AnimatedMovieCardWidget(
                movieId: movieEntity.id,
                posterPath: movieEntity.posterPath,
                pageController: _pageController,
                index: index,);
          },
          pageSnapping: true,
          itemCount: widget.movies.length,
          onPageChanged: (index) {
            BlocProvider.of<MovieBackdropBloc>(context).add(MovieBackdropChangedEvent(widget.movies[index]));
          },
        )
    );
  }
}
