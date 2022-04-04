import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/extensions/size_extentions.dart';
import 'package:movie_app/common/screenutil/screenutil.dart';
import 'package:movie_app/data/core/api_constants_file.dart';
import 'package:movie_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

import '../../../../common/constants/size_constants.dart';

class MovieBackdropWidget extends StatelessWidget {
  const MovieBackdropWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(Sizes.dimen_40.w)),
        child: Stack(children: [
          FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1,
              child: BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
                  builder: (context, state) {
                    if (state is MovieBackdropChanged) {
                      return CachedNetworkImage(
                        imageUrl:
                        '${ApiConstants.BASE_IMAGE_URL}${state.movieEntity.backdropPath}',
                        fit: BoxFit.fitHeight,
                      );
                    }
                    return const SizedBox.shrink();
                  })),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: Container(
              height: 1,
              width: ScreenUtil.screenWidth,
              color: Colors.transparent,
            ),)
        ]),
      ),
    );

  }
}
