import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class BodyText extends StatelessWidget {
  final String body;

  const BodyText({super.key, required this.body});

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Text(body,
          style: context.bodyMedium, textAlign: TextAlign.justify));
}
