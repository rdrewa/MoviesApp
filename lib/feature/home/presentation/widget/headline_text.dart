import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class HeadlineText extends StatelessWidget {
  final String text;

  const HeadlineText({super.key, required this.text});

  @override
  Widget build(BuildContext context) =>
      Text(text, style: context.headlineMedium);
}
