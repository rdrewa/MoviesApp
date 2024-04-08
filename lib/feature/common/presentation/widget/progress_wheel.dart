import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class ProgressWheel extends StatelessWidget {
  final double size;
  final Color? color;
  final Color? background;
  final double? height;

  const ProgressWheel(
      {super.key, this.size = 50, this.color, this.background, this.height});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        child: Center(
          child: SizedBox(
            height: size,
            width: size,
            child: CircularProgressIndicator(
              color: color ?? context.colorScheme.tertiary,
              backgroundColor:
                  background ?? context.colorScheme.tertiaryContainer,
              strokeWidth: 0.15 * size,
            ),
          ),
        ),
      );
}
