import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class WatchOverview extends StatelessWidget {
  final String overview;

  const WatchOverview({super.key, required this.overview});

  @override
  Widget build(BuildContext context) => Text(overview,
      maxLines: 5,
      overflow: TextOverflow.fade,
      textAlign: TextAlign.justify,
      style: context.bodySmall);
}
