import 'package:flutter/material.dart';

class RateStar extends StatelessWidget {
  final double voteAverage;

  const RateStar({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          const Icon(Icons.star, color: Colors.yellowAccent,),
          const SizedBox(
            width: 4,
          ),
          Text(
            voteAverage.toString(),
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: Colors.yellowAccent),
          )
        ],
      );
}
