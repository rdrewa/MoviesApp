import 'package:flutter/material.dart';

import '../../../common/domain/model/movie.dart';

class WatchItem extends StatelessWidget {
  final Movie item;

  const WatchItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Text(item.title);
  }
}
