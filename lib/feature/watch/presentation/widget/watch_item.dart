import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/feature/watch/presentation/widget/watch_overview.dart';
import 'package:movies_app/feature/watch/presentation/widget/watch_title.dart';

import '../../../../core/extension/string_image_extension.dart';
import '../../../home/presentation/widget/rate_star.dart';
import '../../../home/presentation/widget/release_date_text.dart';
import '../../../common/domain/model/movie.dart';

class WatchItem extends StatelessWidget {
  final Movie item;
  final Function() onTap;

  const WatchItem({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
            color: Colors.orange, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 180,
              width: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          CachedNetworkImageProvider(item.posterPath!.imageW500),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WatchTitle(title: item.title),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [ReleaseDateText(releaseDate: item.releaseDate!), RateStar(voteAverage: item.voteAverage)] ),
                  const SizedBox(height: 8,),
                  WatchOverview(overview: item.overview)
                ],
              ),
            )
          ],
        )),
  );
}
