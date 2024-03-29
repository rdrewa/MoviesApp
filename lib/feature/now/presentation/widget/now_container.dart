import 'package:flutter/material.dart';

import '../../domain/model/movie_now.dart';
import 'now_item.dart';

class NowContainer extends StatelessWidget {
  final List<MovieNow> list;

  const NowContainer({super.key, required this.list});

  @override
  Widget build(BuildContext context) => ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) =>
          NowItem(item: list[index]));
}
