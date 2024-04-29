import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/feature/common/presentation/widget/progress_wheel.dart';

import '../../../../../app/app_routes.dart';
import '../../../domain/model/skyscraper_data.dart';
import 'skyscraper_item.dart';

class SkyscraperGrid extends StatelessWidget {
  final String title;
  final List<SkyscraperData> list;
  final bool hasMore;

  const SkyscraperGrid(
      {super.key,
      required this.title,
      required this.list,
      required this.hasMore});

  @override
  Widget build(BuildContext context) => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.5),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: list.length + (hasMore ? 1 : 0),
      itemBuilder: (BuildContext context, int index) => (index >= list.length)
          ? const ProgressWheel(
              height: 150,
            )
          : SkyscraperItem(
              item: list[index],
              width: 120,
              onTap: () => context.goNamed(AppRoutes.details,
                  pathParameters: {'id': list[index].identifier.toString()})));
}
