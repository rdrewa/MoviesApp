import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class DescriptionText extends StatelessWidget {
  final String description;

  const DescriptionText({super.key, required this.description});

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(description,
          style: context.bodyMedium, textAlign: TextAlign.justify));
}
