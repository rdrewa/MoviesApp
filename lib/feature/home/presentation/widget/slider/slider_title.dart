import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class SliderTitle extends StatelessWidget {
  final String title;

  const SliderTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
          color: context.colorScheme.background.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(title, style: context.titleMedium));
}
