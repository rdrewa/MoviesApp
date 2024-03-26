import 'package:flutter/material.dart';

import '../../../common/domain/model/movie.dart';
import '../../domain/model/movie_details.dart';
import 'watch_icon.dart';

class DetailsContainer extends StatelessWidget {
  final MovieDetails details;

  const DetailsContainer({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${details.id}.'),
          Text(details.title),
          Text(details.overview),
          const SizedBox(
            height: 20,
          ),
          const Text('Similar'),
          WatchIcon(item: Movie.fromDetails(details))
        ],
      ),
    );
  }
}
