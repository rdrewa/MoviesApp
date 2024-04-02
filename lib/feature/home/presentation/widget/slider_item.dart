import 'package:flutter/material.dart';

import '../../../../core/extension/string_image_extension.dart';
import '../../../common/domain/model/movie.dart';
import 'rate_star.dart';
import 'release_date_text.dart';
import 'title_text.dart';

class SliderItem extends StatelessWidget {
  final Movie item;
  final double width;
  final Function() onTap;

  const SliderItem({super.key,
    required this.item,
    required this.width,
    required this.onTap});

  @override
  Widget build(BuildContext context) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(item.backdropPath!.imageW500))),
          child: Container(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(title: item.title),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReleaseDateText(releaseDate: item.releaseDate!),
                    RateStar(voteAverage: item.voteAverage)
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
