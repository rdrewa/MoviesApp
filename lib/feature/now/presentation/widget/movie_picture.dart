import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MoviePicture extends StatelessWidget {
  final String url;

  const MoviePicture({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
      child: CachedNetworkImage(
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10)),
        ),
        progressIndicatorBuilder: (context, url, progress) => Center(
            child: CircularProgressIndicator(
          value: progress.progress,
        )),
        errorWidget: (context, url, error) =>
            const Icon(Icons.motion_photos_off_outlined),
      ),
    );
  }
}
