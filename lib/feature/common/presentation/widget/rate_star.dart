import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class RateStar extends StatelessWidget {
  final double voteAverage;
  final bool withBackground;

  const RateStar({super.key, required this.voteAverage, this.withBackground = false});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
        color: context.colorScheme.background
            .withOpacity(withBackground ? 0.6 : 0.0),
        borderRadius: BorderRadius.circular(10)),
    padding: EdgeInsets.symmetric(
        horizontal: withBackground ? 10 : 0,
        vertical: withBackground ? 2 : 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: context.colorScheme.tertiary),
            const SizedBox(width: 4),
            Text(voteAverage.toString(), style: context.labelMedium)
          ],
        ),
  );
}
