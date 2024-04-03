import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/string_image_extension.dart';
import '../../domain/model/movie_now.dart';

class CarouselItem extends StatelessWidget {
  final MovieNow item;
  final double height;

  CarouselItem({super.key, required this.item, required this.height});

  final colors = [
    Colors.yellow,
    Colors.red,
    Colors.grey,
    Colors.blue,
    Colors.amber,
    Colors.blueGrey,
    Colors.white70,
    Colors.indigo,
    Colors.purple,
    Colors.blueGrey,
    Colors.orange,
    Colors.purpleAccent,
    Colors.blue,
    Colors.amber,
    Colors.blueGrey,
    Colors.white70,
    Colors.indigo,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    final backdrops = item.pictures.backdrops.take(6).toList();
    final posters = item.pictures.posters.take(8).toList();
    final logos = item.pictures.logos.take(3).toList();
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
        ),
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.maxFinite,
              height: 180.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        item.backdropPath!.imageW500)),
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),

            Text('Backdrops'),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                physics: const ClampingScrollPhysics(),
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: false,
                children: backdrops
                    .map((picture) => MoviePicture(
                        url: picture.filePath.imageW500,
                        color:
                            colors[backdrops.indexOf(picture) % colors.length]))
                    .toList(),
              ),
            ),
            Text('Posters'),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                physics: const ClampingScrollPhysics(),
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: false,
                children: posters
                    .map((picture) => MoviePicture(
                    url: picture.filePath.imageW500,
                    color:
                    colors[posters.indexOf(picture) % colors.length]))
                    .toList(),
              ),
            ),
            Text('Logos'),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                physics: const ClampingScrollPhysics(),
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: false,
                children: logos
                    .map((picture) => MoviePicture(
                    url: picture.filePath.imageW500,
                    color:
                    colors[logos.indexOf(picture) % colors.length]))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MoviePicture extends StatelessWidget {
  final String url;
  final Color color;

  const MoviePicture({super.key, required this.url, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 160,
      // height: 150,
      color: color,
      child: Image(
        image: CachedNetworkImageProvider(url),
        // width: 160,
        // height: 180,
      ),
    );
  }
}
