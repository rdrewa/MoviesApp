import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/core/extension/build_context_theme_extension.dart';

class CarouselImage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final Function() onTap;

  const CarouselImage(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.maxFinite,
          height: 180.0,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: CachedNetworkImageProvider(imageUrl)),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(title, style: context.headlineMedium)],
            ),
          ),
        ),
      );
}
