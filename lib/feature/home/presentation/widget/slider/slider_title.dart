import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class SliderTitle extends StatelessWidget {
  final String title;

  const SliderTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Text(title, style: context.titleMedium);
}
