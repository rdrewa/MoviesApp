import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/extension/string_image_extension.dart';
import '../../domain/model/movie_now.dart';
import '../../domain/model/picture.dart';
import 'pictures_grid.dart';

class CarouselItem extends StatelessWidget {
  final MovieNow item;
  final double height;

  const CarouselItem({super.key, required this.item, required this.height});

  String _backdropProvider(Picture picture) => picture.filePath.imageW1280;

  String _posterProvider(Picture picture) => picture.filePath.imageW500;

  String _logoProvider(Picture picture) => picture.filePath.imageW300;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
          ),
          height: height,
          child: SingleChildScrollView(
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
                    padding: const EdgeInsets.only(left: 10, top: 20),
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
                DefaultTabController(
                    length: 3,
                    child: SizedBox(
                      height: 400,
                      child: Column(
                        children: [
                          const TabBar(tabs: [
                            Tab(
                              text: "Backdrops",
                            ),
                            Tab(
                              text: "Posters",
                            ),
                            Tab(
                              text: "Logos",
                            )
                          ]),
                          Expanded(
                            child: TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  PicturesGrid(
                                      count: 3,
                                      list: item.pictures.backdrops,
                                      provider: _backdropProvider),
                                  PicturesGrid(
                                      count: 4,
                                      list: item.pictures.posters,
                                      provider: _posterProvider),
                                  PicturesGrid(
                                      count: 3,
                                      list: item.pictures.logos,
                                      provider: _logoProvider)
                                ]),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      );
}
