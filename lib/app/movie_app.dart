import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../feature/home/presentation/bloc/popular/popular_bloc.dart';
import '../feature/home/presentation/bloc/toprated/top_rated_bloc.dart';
import '../feature/home/presentation/bloc/trending/trending_bloc.dart';
import '../feature/home/presentation/screen/home_screen.dart';

import 'di.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => sl<TrendingBloc>()..add(GetTrendingEvent())),
        BlocProvider(
            create: (_) => sl<PopularBloc>()..add(GetPopularEvent())),
        BlocProvider(
            create: (_) => sl<TopRatedBloc>()..add(GetTopRatedEvent()))
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: HomeScreen(),
        ),
      ),
    );
  }
}
