import 'package:flutter/material.dart';

class SliderTitle extends StatelessWidget {
  final String title;

  const SliderTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(color: Colors.white),
      );
}
