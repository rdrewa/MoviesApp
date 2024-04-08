import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class PopularityHeart extends StatelessWidget {
  final double popularity;
  final bool withBackground;

  const PopularityHeart(
      {super.key, required this.popularity, this.withBackground = false});

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
          children: [
            Text(popularity.toString(), style: context.labelMedium),
            const SizedBox(width: 4),
            Icon(Icons.heart_broken, color: context.colorScheme.tertiary)
          ],
        ),
      );
}
