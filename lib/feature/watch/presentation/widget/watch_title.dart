import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class WatchTitle extends StatelessWidget {
  final String title;

  const WatchTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      Text(title, maxLines: 1, style: context.titleLarge);
}
