import 'package:flutter/material.dart';

import '/feature/common/domain/model/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie data;

  const MovieItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
          children: [
            Text(data.title),
            Text(data.overview)
          ],
        ),
      );
}
