import 'package:flutter/material.dart';

class HeadlineText extends StatelessWidget {
  final String text;

  const HeadlineText({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(color: Colors.white),
      );
}
