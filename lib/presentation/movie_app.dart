import 'package:flutter/material.dart';
import 'package:movie_app/presentation/themes/app_colors.dart';
import 'package:movie_app/presentation/themes/theme_text.dart';
import 'package:movie_app/presentation/journeys/home/home_screen.dart';

import '../common/screenutil/screenutil.dart';

class MovieApp extends StatelessWidget{
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primaryColor: AppColors.vulcan,
        scaffoldBackgroundColor: AppColors.vulcan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: const HomeScreen(),
    );
  }
}