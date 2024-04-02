import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

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
                  item: list[index], width: double.maxFinite, onTap: () {}),
              options: CarouselOptions(
                viewportFraction: 1,
                height: height,
                // autoPlay: true,
              )),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: HeadlineText(
              text: title,
            ),
          ),
        ],
      );
}
