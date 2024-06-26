import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/app_routes.dart';
import '../../domain/model/movie_now.dart';
import 'carousel_item.dart';

class CarouselList extends StatelessWidget {
  final List<MovieNow> list;

  const CarouselList({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height - 40;
    return CarouselSlider(
        items: list
            .map((item) => CarouselItem(
                item: item,
                height: height,
                onTap: () => context.goNamed(AppRoutes.details,
                    pathParameters: {'id': item.id.toString()})))
            .toList(),
        options: CarouselOptions(
          height: height,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ));
  }
}
