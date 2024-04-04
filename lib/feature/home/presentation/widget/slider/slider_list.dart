import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../app/app_routes.dart';
import '../../../../common/domain/model/movie.dart';
import '../headline_text.dart';
import 'slider_item.dart';

class SliderList extends StatelessWidget {
  final String title;
  final List<Movie> list;
  final double height;

  const SliderList(
      {super.key,
      required this.title,
      required this.list,
      required this.height});

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          CarouselSlider.builder(
              itemCount: list.length,
              itemBuilder: (context, index, realIndex) => SliderItem(
                  item: list[index],
                  width: double.maxFinite,
                  onTap: () => context.goNamed(AppRoutes.details,
                      pathParameters: {'id': list[index].id.toString()})),
              options: CarouselOptions(viewportFraction: 1, height: height)),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: HeadlineText(text: title),
          ),
        ],
      );
}
