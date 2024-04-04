import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/app_routes.dart';
import '../../../common/domain/model/movie.dart';
import '../widget/watch_item.dart';

class WatchListContainer extends StatelessWidget {
  final List<Movie> list;

  const WatchListContainer({super.key, required this.list});

  @override
  Widget build(BuildContext context) => ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) => WatchItem(
          item: list[index],
          onTap: () => context.goNamed(AppRoutes.details,
              pathParameters: {'id': list[index].id.toString()})));
}
