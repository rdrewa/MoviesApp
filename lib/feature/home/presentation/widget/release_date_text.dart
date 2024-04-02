import 'package:flutter/material.dart';

import '../../../../core/extension/date_time_format_extension.dart';

class ReleaseDateText extends StatelessWidget {
  final DateTime releaseDate;

  const ReleaseDateText({super.key, required this.releaseDate});

  @override
  Widget build(BuildContext context) => Text(
        releaseDate.dashDate,
        style: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: Colors.yellow),
      );
}
