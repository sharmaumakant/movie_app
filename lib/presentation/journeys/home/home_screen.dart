import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

import '../../blocs/movie_carousal/movie_carousal_bloc.dart';
import '../../blocs/movie_carousal/movie_carousal_event.dart';
import 'movie_carousal/movie_carousal_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late MovieCarousalBloc movieCarousalBloc;
  late MovieBackdropBloc movieBackdropBloc;

  @override
  void initState() {
    super.initState();
    movieCarousalBloc = getItInstance.get<MovieCarousalBloc>();
    movieCarousalBloc.add(const CarousalLoadEvent());
    //movieBackdropBloc = getItInstance.get<MovieBackdropBloc>();
    //movieBackdropBloc.add(MovieBackdropChangedEvent());
    movieBackdropBloc = movieCarousalBloc.movieBackdropBloc;
  }

  @override
  void dispose() {
    super.dispose();
    movieCarousalBloc.close();
  }


  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => movieCarousalBloc),
          BlocProvider(create: (context) => movieBackdropBloc)
        ],
        child: Scaffold(
          body: BlocBuilder<MovieCarousalBloc, MovieCarousalState>(
            bloc: movieCarousalBloc,
            builder: (context, state) {
              if(state is MovieCarousalLoaded) {
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.6,
                      child: MovieCarousalWidget(
                          movies: state.movies,
                          defaultIndex: state.defaultIndex
                      ),
                    ),
                    const FractionallySizedBox(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.4,
                      child: Placeholder(color: Colors.white,),
                    )
                  ],
                );
              } else {
              return const SizedBox.shrink();
            }
          },
        )
      ),
    );
  }
}
