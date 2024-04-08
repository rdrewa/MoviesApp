import 'package:flutter/material.dart';

import '/core/extension/date_time_format_extension.dart';
import '/core/extension/build_context_theme_extension.dart';

class ReleaseDateText extends StatelessWidget {
  final DateTime releaseDate;
  final bool withBackground;

  const ReleaseDateText(
      {super.key, required this.releaseDate, this.withBackground = false});

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
          color: context.colorScheme.background
              .withOpacity(withBackground ? 0.6 : 0.0),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(
          horizontal: withBackground ? 10 : 0,
          vertical: withBackground ? 2 : 0),
      child: Text(releaseDate.dashDate, style: context.labelMedium));
}
