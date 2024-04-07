import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class RateStar extends StatelessWidget {
  final double voteAverage;

  const RateStar({super.key, required this.voteAverage});

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Icon(Icons.star, color: context.colorScheme.tertiary),
          const SizedBox(width: 4),
          Text(voteAverage.toString(), style: context.labelMedium)
        ],
      );
}
