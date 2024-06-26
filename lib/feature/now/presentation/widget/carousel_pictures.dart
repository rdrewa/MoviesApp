import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '/core/extension/string_image_extension.dart';
import '../../domain/model/picture.dart';
import 'pictures_grid.dart';

class CarouselPictures extends StatelessWidget {
  final List<Picture> backdrops;
  final List<Picture> posters;
  final List<Picture> logos;

  const CarouselPictures(
      {super.key,
      required this.backdrops,
      required this.posters,
      required this.logos});

  String _backdropProvider(Picture picture) => picture.filePath.imageW1280;

  String _posterProvider(Picture picture) => picture.filePath.imageW500;

  String _logoProvider(Picture picture) => picture.filePath.imageW300;

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: SizedBox(
        height: 390,
        child: Column(
          children: [
            TabBar(tabs: [
              Tab(text: 'now.pictures.backdrops'.tr()),
              Tab(text: 'now.pictures.posters'.tr()),
              Tab(text: 'now.pictures.logos'.tr())
            ]),
            Expanded(
              child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    PicturesGrid(
                        count: 3,
                        list: backdrops,
                        ratio: 1.778,
                        provider: _backdropProvider),
                    PicturesGrid(
                        count: 4,
                        list: posters,
                        ratio: 0.667,
                        provider: _posterProvider),
                    PicturesGrid(
                        count: 3,
                        list: logos,
                        ratio: 3.409,
                        provider: _logoProvider)
                  ]),
            )
          ],
        ),
      ));
}
