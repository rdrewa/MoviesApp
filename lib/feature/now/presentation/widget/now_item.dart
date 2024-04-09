import 'package:flutter/material.dart';

import '../../domain/model/movie_now.dart';

class NowItem extends StatelessWidget {
  final MovieNow item;

  const NowItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Text(item.title);
  }
}
