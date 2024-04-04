import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoviePicture extends StatelessWidget {
  final String url;
  final Color color;

  const MoviePicture({super.key, required this.url, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 160,
      // height: 150,
      color: color,
      child: Image(
        image: CachedNetworkImageProvider(url),
        // width: 160,
        // height: 180,
      ),
    );
  }
}
