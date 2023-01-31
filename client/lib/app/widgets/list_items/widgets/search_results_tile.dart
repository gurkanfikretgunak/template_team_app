import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SearchResultsTile extends StatelessWidget {
  const SearchResultsTile({
    super.key,
    this.imgSize = 75,
    this.imgRadius = 4,
    this.imgPath,
    this.category,
    this.title,
    this.isResult = true,
    this.resultCount,
    this.location,
  });
  final double imgSize;
  final String? imgPath;
  final double imgRadius;
  final String? category;
  final String? title;
  final String? resultCount;
  final String? location;
  final bool isResult;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: imgPath ?? 'https://picsum.photos/250?image=9',
          imageBuilder: (context, imageProvider) {
            return Container(
              margin: const EdgeInsets.only(right: 8),
              width: imgSize,
              height: imgSize,
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                borderRadius: BorderRadius.all(
                  Radius.circular(isResult ? 60 : imgRadius),
                ),
              ),
            );
          },
          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isResult ? const SizedBox.shrink() : Text(category ?? 'FOR MEN'),
            Text(title ?? 'Miko Salon'),
            isResult ? Text(resultCount ?? '122 Results') : Text(location ?? 'Ranchview'),
          ],
        ),
      ],
    );
  }
}
