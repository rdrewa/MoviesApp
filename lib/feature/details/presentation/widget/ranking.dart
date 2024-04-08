import 'package:flutter/material.dart';

import '../../../common/presentation/widget/rate_star.dart';
import 'popularity_heart.dart';

class Ranking extends StatelessWidget {
  final double vote;
  final double popularity;

  const Ranking({super.key, required this.vote, required this.popularity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RateStar(voteAverage: vote),
          PopularityHeart(popularity: popularity)
        ],
      ),
    );
  }
}
