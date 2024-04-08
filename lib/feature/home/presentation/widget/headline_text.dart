import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class HeadlineText extends StatelessWidget {
  final String text;
  final bool withBackground;

  const HeadlineText(
      {super.key, required this.text, this.withBackground = false});

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
          color: context.colorScheme.background
              .withOpacity(withBackground ? 1.0 : 0.0),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(
          horizontal: withBackground ? 6 : 0, vertical: withBackground ? 2 : 0),
      child: Text(text, style: context.headlineMedium));
}
