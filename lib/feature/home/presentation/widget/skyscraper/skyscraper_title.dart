import 'package:flutter/material.dart';

class SkyscraperTitle extends StatelessWidget {
  final String title;

  const SkyscraperTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Text(
        title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.white),
      );
}
