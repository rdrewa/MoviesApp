import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../common/presentation/widget/top_bar.dart';
import 'popular_movies.dart';
import 'top_rated_movies.dart';
import 'trending_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopBar(title: 'home.title'.tr()),
        body: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [TrendingMovies(), PopularMovies(), TopRatedMovies()],
          ),
        ));
  }
}
