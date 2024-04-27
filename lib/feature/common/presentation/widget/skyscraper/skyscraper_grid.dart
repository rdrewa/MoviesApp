import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/app_routes.dart';
import '../../../domain/model/skyscraper_data.dart';
import 'skyscraper_item.dart';

class SkyscraperGrid extends StatelessWidget {
  final String title;
  final List<SkyscraperData> list;
  final double height;

  const SkyscraperGrid(
      {super.key, required this.title, required this.list, this.height = 250});

  @override
  Widget build(BuildContext context) => GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 0.5),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) => SkyscraperItem(
          item: list[index],
          width: 120,
          onTap: () => context.goNamed(AppRoutes.details,
              pathParameters: {'id': list[index].identifier.toString()})));
}
