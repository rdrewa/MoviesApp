import 'package:flutter/material.dart';

import '../../domain/model/picture.dart';
import 'movie_picture.dart';

class PicturesGrid extends StatelessWidget {
  final int count;
  final List<Picture> list;
  final String Function(Picture) provider;

  final _colors = [
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

  PicturesGrid(
      {super.key,
      required this.count,
      required this.list,
      required this.provider});

  @override
  Widget build(BuildContext context) => GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: count),
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) => MoviePicture(
            url: provider(list[index]), color: _colors[index % _colors.length]),
      );
}
