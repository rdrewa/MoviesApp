import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/app/app_routes.dart';
import '/feature/common/domain/model/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie data;

  const MovieItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () => context.pushNamed(AppRoutes.details,
            pathParameters: {'id': data.id.toString()}),
        child: Container(
          color: Colors.blue,
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Column(
            children: [Row(children: [Text('${data.id}: '), Text(data.title)],), Text(data.overview)],
          ),
        ),
      );
}
