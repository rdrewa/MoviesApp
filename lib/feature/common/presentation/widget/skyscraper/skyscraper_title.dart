import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class SkyscraperTitle extends StatelessWidget {
  final String title;

  const SkyscraperTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Text(title,
      maxLines: 2, overflow: TextOverflow.ellipsis, style: context.bodySmall);
}
