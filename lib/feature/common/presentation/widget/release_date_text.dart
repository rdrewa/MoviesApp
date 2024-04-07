import 'package:flutter/material.dart';

import '/core/extension/date_time_format_extension.dart';
import '/core/extension/build_context_theme_extension.dart';

class ReleaseDateText extends StatelessWidget {
  final DateTime releaseDate;

  const ReleaseDateText({super.key, required this.releaseDate});

  @override
  Widget build(BuildContext context) =>
      Text(releaseDate.dashDate, style: context.labelMedium);
}
