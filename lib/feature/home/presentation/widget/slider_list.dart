import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../common/domain/model/movie.dart';
import 'slider_item.dart';

class SliderList extends StatelessWidget {
  final String title;
  final List<Movie> list;

  const SliderList({super.key, required this.title, required this.list});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height * 0.35;
    return Stack(
      children: [
        CarouselSlider.builder(
            itemCount: list.length,
            itemBuilder: (context, index, realIndex) => SliderItem(
                item: list[index], width: double.maxFinite, onTap: () {}),
            options: CarouselOptions(
              viewportFraction: 1,
              height: height,
              // autoPlay: true,
            )),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 20),
          child: Text(title, style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),),
        ),
      ],
    );
  }
}
