import 'package:flutter/material.dart';
import 'package:hash_cached_image/hash_cached_image.dart';

import 'media_query.dart';

class AppHashCacheImage extends StatelessWidget {
  final String? imageUrl;
  final double? Height;
  final double? Width;
  final BoxFit? fit;
  const AppHashCacheImage(
      {super.key, this.imageUrl, this.Height, this.Width, this.fit});

  @override
  Widget build(BuildContext context) {
    return HashCachedImage(
        imageUrl: imageUrl!.toString(),
        height: Height,
        width: Width,
        fit: fit,
        errorWidget: (context, url, error) => Padding(
            padding: EdgeInsets.symmetric(vertical: height(context) * 0.1),
            child: Center(
              child: Icon(
                Icons.error_outline,
                size: MediaQuery.of(context).size.height * 0.09,
              ),
            )));
  }
}
