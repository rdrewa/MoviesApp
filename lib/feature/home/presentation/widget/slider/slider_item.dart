import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extension/string_image_extension.dart';
import '../../../../common/domain/model/movie.dart';
import '../../../../common/presentation/widget/rate_star.dart';
import '../../../../common/presentation/widget/release_date_text.dart';
import 'slider_title.dart';

class SliderItem extends StatelessWidget {
  final Movie item;
  final double width;
  final Function() onTap;

  const SliderItem(
      {super.key,
      required this.item,
      required this.width,
      required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                      item.backdropPath!.imageW500))),
          child: Container(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SliderTitle(title: item.title),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReleaseDateText(
                        releaseDate: item.releaseDate!, withBackground: true),
                    RateStar(
                        voteAverage: item.voteAverage, withBackground: true)
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
