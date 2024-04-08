import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../../core/extension/string_image_extension.dart';
import '../../../../common/domain/model/skyscraper_data.dart';
import '../../../../common/presentation/widget/rate_star.dart';
import 'skyscraper_title.dart';

class SkyscraperItem extends StatelessWidget {
  final SkyscraperData item;
  final double width;
  final Function() onTap;

  const SkyscraperItem(
      {super.key,
      required this.item,
      required this.width,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: item.hasVote ? onTap : null,
        child: Container(
            padding: const EdgeInsets.only(right: 8),
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  height: 175,
                  imageUrl: item.imageUrl!.imageW500,
                ),
                const SizedBox(
                  height: 8,
                ),
                SkyscraperTitle(title: item.label),
                item.hasVote
                    ? RateStar(voteAverage: item.vote)
                    : const SizedBox.shrink()
                // RateStar(voteAverage: item.vote)
              ],
            )));
  }
}
