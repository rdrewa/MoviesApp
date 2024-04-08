import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';
import '/core/extension/string_image_extension.dart';

class MainImage extends StatelessWidget {
  final String? imageUrl;
  final String title;

  const MainImage({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) => Container(
        width: double.maxFinite,
        height: 240.0,
        decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(imageUrl!.imageW500)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 20),
          child: Container(
            alignment: AlignmentDirectional.bottomStart,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                    color: context.colorScheme.background.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(title, style: context.headlineMedium)),
          ),
        ),
      );
}
