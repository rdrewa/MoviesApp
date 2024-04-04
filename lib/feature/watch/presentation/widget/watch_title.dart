import 'package:flutter/material.dart';

class WatchTitle extends StatelessWidget {
  final String title;

  const WatchTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      Text(title, maxLines: 1, style: Theme.of(context).textTheme.titleLarge);
}
