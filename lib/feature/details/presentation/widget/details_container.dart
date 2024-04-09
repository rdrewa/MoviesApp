import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../common/presentation/widget/headline_text.dart';
import '../../../common/presentation/widget/skyscraper/skyscraper_list.dart';
import '../../domain/model/movie_details.dart';
import 'body_text.dart';
import 'main_image.dart';
import 'ranking.dart';
import 'author_text.dart';

class DetailsContainer extends StatelessWidget {
  final MovieDetails details;

  const DetailsContainer({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainImage(imageUrl: details.backdropPath, title: details.title),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ranking(
                        vote: details.voteAverage,
                        popularity: details.popularity),
                    HeadlineText(text: 'details.description'.tr()),
                    BodyText(body: details.overview),
                    details.hasReview
                        ? HeadlineText(text: 'details.review'.tr())
                        : const SizedBox.shrink(),
                    details.hasReview
                        ? BodyText(body: details.review)
                        : const SizedBox.shrink(),
                    details.hasReview
                        ? AuthorText(author: details.author)
                        : const SizedBox.shrink(),
                  ])),
          SkyscraperList(
              title: 'details.cast'.tr(), list: details.actors, height: 220),
          SkyscraperList(title: 'details.similar'.tr(), list: details.similar),
          SkyscraperList(
              title: 'details.recommendations'.tr(),
              list: details.recommendations),
        ],
      ),
    );
  }
}
