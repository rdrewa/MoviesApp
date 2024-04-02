import 'package:flutter/material.dart';

import 'popular_movies.dart';
import 'top_rated_movies.dart';
import 'trending_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [TrendingMovies(), PopularMovies(), TopRatedMovies()],
      ),
    ));
  }
}
