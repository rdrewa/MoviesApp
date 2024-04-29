import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/app_routes.dart';
import '../../../domain/model/skyscraper_data.dart';
import '../headline_text.dart';
import 'skyscraper_item.dart';

class SkyscraperList extends StatelessWidget {
  final String title;
  final List<SkyscraperData> list;
  final double height;
  final String? route;

  const SkyscraperList(
      {super.key, required this.title, required this.list, this.height = 250, this.route});

  @override
  Widget build(BuildContext context) {
    if (list.isEmpty) return const SizedBox.shrink();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          HeadlineText(text: title, route: route),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: height,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (BuildContext context, int index) =>
                    SkyscraperItem(
                        item: list[index],
                        width: 120,
                        onTap: () => context.goNamed(AppRoutes.details,
                                pathParameters: {
                                  'id': list[index].identifier.toString()
                                }))),
          )
        ],
      ),
    );
  }
}
