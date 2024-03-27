import 'package:flutter/material.dart';
import 'package:movies_app/feature/watch/presentation/widget/watch_item.dart';

import '../../../common/domain/model/movie.dart';

class WatchListContainer extends StatelessWidget {
  final List<Movie> list;

  const WatchListContainer({super.key, required this.list});

  @override
  Widget build(BuildContext context) => ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) =>
          WatchItem(item: list[index]));
}
