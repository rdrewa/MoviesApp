import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/core/extension/build_context_theme_extension.dart';

class HeadlineText extends StatelessWidget {
  final String text;
  final bool withBackground;
  final String? route;

  const HeadlineText(
      {super.key, required this.text, this.withBackground = false, this.route});

  @override
  Widget build(BuildContext context) => Container(
      decoration: BoxDecoration(
          color: context.colorScheme.background
              .withOpacity(withBackground ? 1.0 : 0.0),
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(
          horizontal: withBackground ? 6 : 0, vertical: withBackground ? 2 : 0),
      child: route != null
          ? Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start,  children: [
              Text(text, style: context.headlineMedium),
              TextButton(
                  onPressed: () => context.goNamed(route!),
                  child: const Text('see all'))
            ])
          : Text(text, style: context.headlineMedium));
}
