import 'package:flutter/material.dart';

import '../../domain/model/picture.dart';
import 'movie_picture.dart';

class PicturesGrid extends StatelessWidget {
  final int count;
  final List<Picture> list;
  final double ratio;
  final String Function(Picture) provider;

  const PicturesGrid(
      {super.key,
      required this.count,
      required this.list,
      required this.ratio,
      required this.provider});

  @override
  Widget build(BuildContext context) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: count,
            mainAxisSpacing: 2,
            crossAxisSpacing: 4,
            childAspectRatio: ratio),
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) =>
            MoviePicture(url: provider(list[index])),
      );
}
