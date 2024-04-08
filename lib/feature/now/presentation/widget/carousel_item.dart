import 'package:flutter/material.dart';

import '../../../../core/extension/build_context_theme_extension.dart';
import '../../../../core/extension/string_image_extension.dart';
import '../../domain/model/movie_now.dart';
import 'carousel_image.dart';
import 'carousel_pictures.dart';

class CarouselItem extends StatelessWidget {
  final MovieNow item;
  final double height;
  final Function() onTap;

  const CarouselItem(
      {super.key,
      required this.item,
      required this.height,
      required this.onTap});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: context.colorScheme.tertiaryContainer,
          ),
          height: height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CarouselImage(
                    imageUrl: item.backdropPath!.imageW500,
                    title: item.title,
                    onTap: onTap),
                CarouselPictures(
                    backdrops: item.pictures.backdrops,
                    posters: item.pictures.posters,
                    logos: item.pictures.logos)
              ],
            ),
          ),
        ),
      );
}
